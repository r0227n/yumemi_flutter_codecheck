import 'license.dart';
import 'owner.dart';

/// Parsed as elements of the [items] property of [GitHubResponse]
sealed class GitHubItem {}

/// Parsed as elements of the [items] property for the Repository's [GitHubResponse]
class RepositoryItem extends GitHubItem {
  RepositoryItem({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.isPrivate,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.score,
    required this.license,
  });

  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final Owner owner;
  final bool isPrivate;
  final String htmlUrl;
  final String description;
  final bool fork;
  final String url;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;
  final String? homepage;
  final int size;
  final int stargazersCount;
  final int watchersCount;
  final String language;
  final int forksCount;
  final int openIssuesCount;
  final String defaultBranch;
  final double score;
  final License? license;

  factory RepositoryItem.fromJson(Map<String, dynamic> json) {
    return RepositoryItem(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      owner: Owner.fromJson(json['owner']),
      isPrivate: json['private'],
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pushedAt: DateTime.parse(json['pushed_at']),
      homepage: json['homepage'],
      size: json['size'],
      stargazersCount: json['stargazers_count'],
      watchersCount: json['watchers_count'],
      language: json['language'],
      forksCount: json['forks_count'],
      openIssuesCount: json['open_issues_count'],
      defaultBranch: json['default_branch'],
      score: json['score'],
      license: json['license'] != null ? License.fromJson(json['license']) : null,
    );
  }
}
