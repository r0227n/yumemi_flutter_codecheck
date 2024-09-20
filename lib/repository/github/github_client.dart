import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  head,
  options,
  patch;
}

enum Sort {
  stars('stars'),
  forks('forks'),
  helpWantedIssues('help-wanted-issues'),
  updated('updated');

  const Sort(this.kebabCase);

  final String kebabCase;
}

enum Order {
  desc,
  asc;
}

class GithubClient {
  static Future<http.Response> request({
    required String token,
    required Uri url,
    required HttpMethod method,
    required String apiVersion,
  }) async {
    final client = RetryClient(http.Client());
    final header = Map<String, String>.unmodifiable({
      'Accept': 'application/vnd.github+json',
      'Authorization': 'Bear $token',
      'X-GitHub-Api-Version': apiVersion,
    });
    final response = await switch (method) {
      HttpMethod.get => client.get(url, headers: header),
      // TODO: get 意外のmethodを定義時、宣言する。
      HttpMethod.post => throw UnimplementedError(),
      HttpMethod.put => throw UnimplementedError(),
      HttpMethod.delete => throw UnimplementedError(),
      HttpMethod.head => throw UnimplementedError(),
      HttpMethod.options => throw UnimplementedError(),
      HttpMethod.patch => throw UnimplementedError(),
    };

    // TODO: エラーハンドリングの幅をもう少し広げる
    if (response.statusCode != 200) {
      throw HttpException(response.body, uri: url);
    }

    return response;
  }
}
