import 'dart:convert';
import 'github_client.dart';
import 'github_repository.dart';
import 'models/github_response.dart';

/// GitHub Search API's
class GithubSearchRepository extends GithubRepository {
  GithubSearchRepository(this._token);

  final String _token;

  @override
  String get apiVersion => '2022-11-28';

  @override
  String get token => _token;

  @override
  String get featureType => 'search';

  /// Search Repositories
  ///
  /// doc: https://docs.github.com/ja/rest/search/search?apiVersion=2022-11-28#search-code
  Future<GithubResponse> repositories(
    String query, {
    Sort sort = Sort.stars,
    Order order = Order.desc,
    int perPage = 30,
    int page = 1,
  }) async {
    const feature = 'repositories';
    final queryParameters = Map<String, String>.unmodifiable({
      'q': query,
      'sort': sort.kebabCase,
      'order': order.name,
      'per_page': '$perPage',
      'page': '$page',
    });
    final response = await GithubClient.request(
      token: token,
      url: Uri.http(GithubRepository.host, '$featureType/$feature', queryParameters),
      method: HttpMethod.get,
      apiVersion: apiVersion,
    );

    return GithubResponse.fromJson(jsonDecode(response.body), type: ItemType.repository);
  }
}
