import 'dart:convert';
import 'github_client.dart';
import 'github_repository.dart';
import 'models/search_response.dart';
import 'models/repository.dart';

/// GitHub Search API's
class GithubRepoRepository extends GithubRepository {
  GithubRepoRepository(this._token);

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
    Sort sort = Sort.stars,
    Order order = Order.desc,
    int perPage = 30,
    int page = 1,
    String? token,
    String? apiVersion,
  }) async {
    const apiType = 'search';

    final queryParameters = Map<String, String>.unmodifiable({
      'q': query,
      'sort': sort.kebabCase,
      'order': order.name,
      'per_page': '$perPage',
      'page': '$page',
    });

    final response = await GithubClient.request(
      token: token ?? this.token,
      url: Uri.http(GithubRepository.host, '$apiType/$feature', queryParameters),
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

    final response = await GithubClient.request(
      token: token ?? this.token,
      url: Uri.http(GithubRepository.host, '$apiType/$fullName'),
      method: HttpMethod.get,
      apiVersion: apiVersion ?? this.apiVersion,
    );

    return Repository.fromJson(jsonDecode(response.body));
  }
}
