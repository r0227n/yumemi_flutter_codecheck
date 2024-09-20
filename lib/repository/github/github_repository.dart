abstract class GithubRepository {
  static const String host = 'api.github.com';

  /// GitHub token
  String get token;

  /// GitHub API Version
  String get apiVersion;

  /// GitHub API Feature Type
  /// e.g.
  /// - search
  String get featureType;
}
