import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'github_repository.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete,
  head,
  options,
  patch;
}

enum Direction {
  asc,
  desc;
}

class GithubClient {
  static Future<http.Response> request({
    required String token,
    required Uri url,
    required HttpMethod method,
    String? body,
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
      // TODO:必要になった時、定義する
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

  /// GitHub API calls with GraphQL
  ///
  /// docs: https://docs.github.com/en/graphql/guides/forming-calls-with-graphql
  static Future<http.Response> graphql(
    String query, {
    required String token,
  }) async {
    final client = RetryClient(http.Client());

    final url = Uri.https(GithubRepository.host, 'graphql');
    final header = {
      'Authorization': 'bearer $token',
      'Content-Type': 'application/json',
    };
    final response = await client.post(
      url,
      headers: header,
      body: jsonEncode({'query': query}),
    );

    // TODO: エラーハンドリングの幅をもう少し広げる
    final Map<String, dynamic> json = jsonDecode(response.body);
    if (json['data'] == null) {
      throw HttpException(response.body, uri: url);
    }

    return response;
  }
}
