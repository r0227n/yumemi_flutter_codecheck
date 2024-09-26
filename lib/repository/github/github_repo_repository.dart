import 'dart:convert';
import 'package:yumemi_flutter_codecheck/repository/github.dart';

import 'github_client.dart';
import 'github_repository.dart';
import 'models/search_response.dart';
import 'models/repository.dart';

typedef IssueCount = ({int openCount, int closedCount});

enum IssueSort {
  created,
  updated,
  comments;
}

enum RepositorySort {
  stars('stars'),
  forks('forks'),
  helpWantedIssues('help-wanted-issues'),
  updated('updated');

  const RepositorySort(this.kebabCase);

  final String kebabCase;
}

/// GitHub Search API's
class GitHubRepoRepository extends GitHubRepository {
  GitHubRepoRepository(this._token);

  final String _token;

  @override
  String get apiVersion => '2022-11-28';

  @override
  String get token => _token;

  @override
  String get feature => 'repositories';

  /// Search Repositories
  ///
  /// doc: https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#search-repositories
  Future<SearchResponse> search(
    String query, {
    RepositorySort sort = RepositorySort.stars,
    Direction order = Direction.desc,
    int perPage = 30,
    int page = 1,
    String? token,
    String? apiVersion,
  }) async {
    if (perPage > 100) {
      throw ArgumentError('perPage cannot exceed 100.');
    }

    const apiType = 'search';

    final queryParameters = Map<String, String>.unmodifiable({
      'q': query,
      'sort': sort.kebabCase,
      'order': order.name,
      'per_page': '$perPage',
      'page': '$page',
    });

    final response = await GitHubClient.request(
      token: token ?? this.token,
      url: Uri.http(GitHubRepository.host, '$apiType/$feature', queryParameters),
      method: HttpMethod.get,
      apiVersion: apiVersion ?? this.apiVersion,
    );

    return SearchResponse.fromJson(jsonDecode(response.body), type: SearchEntity.repositories);
  }

  /// Get a repository
  ///
  /// doc: https://docs.github.com/ja/rest/repos/repos?apiVersion=2022-11-28#get-a-repository
  Future<Repository> get(
    String fullName, {
    String? token,
    String? apiVersion,
  }) async {
    const apiType = 'repos';

    final response = await GitHubClient.request(
      token: token ?? this.token,
      url: Uri.http(GitHubRepository.host, '$apiType/$fullName'),
      method: HttpMethod.get,
      apiVersion: apiVersion ?? this.apiVersion,
    );

    return Repository.fromJson(jsonDecode(response.body));
  }

  /// Get a Repository's License
  ///
  /// doc:https://docs.github.com/en/rest/licenses/licenses?apiVersion=2022-11-28#get-the-license-for-a-repository
  Future<LicenseContent> getLicense(
    String fullName, {
    String? token,
    String? apiVersion,
  }) async {
    const apiType = 'repos';

    final response = await GitHubClient.request(
      token: token ?? this.token,
      url: Uri.http(GitHubRepository.host, '$apiType/$fullName/license'),
      method: HttpMethod.get,
      apiVersion: apiVersion ?? this.apiVersion,
    );

    return LicenseContent.fromJson(jsonDecode(response.body));
  }

  /// Get the issues of the repository
  ///
  /// GraphQL sample response
  ///
  /// ```json
  /// {
  ///   "data": {
  ///     "repository": {
  ///       "open": {
  ///         "totalCount": 12529
  ///       },
  ///       "closed": {
  ///         "totalCount": 86068
  ///       }
  ///     }
  ///   }
  /// }
  /// ```
  Future<IssueCount> getIssues({
    required String owner,
    required String name,
    String? token,
  }) async {
    final String query = '''
      query {
        repository(owner: "$owner", name: "$name") {
          open: issues(states: OPEN) {
            totalCount
          }
          closed: issues(states: CLOSED) {
            totalCount
          }
        }
      }
    ''';

    final response = await GitHubClient.graphql(query, token: token ?? this.token);

    final Map<String, dynamic> json = jsonDecode(response.body);
    final repositoryIssue = Map<String, dynamic>.from(json['data']['repository']);

    return (
      openCount: repositoryIssue['open']['totalCount'] as int,
      closedCount: repositoryIssue['closed']['totalCount'] as int
    );
  }
}
