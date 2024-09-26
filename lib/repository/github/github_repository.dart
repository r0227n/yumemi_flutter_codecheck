abstract class GitHubRepository {
  static const String host = 'api.github.com';

  /// GitHub token
  String get token;

  /// GitHub API Version
  String get apiVersion;

  /// GitHub API Feature Type
  String get feature;
}
