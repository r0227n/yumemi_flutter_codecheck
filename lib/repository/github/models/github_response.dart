import 'github_item.dart';

/// parse item type
enum ItemType {
  repository,
}

/// GitHub API Response model
class GithubResponse {
  GithubResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<GitHubItem> items;

  factory GithubResponse.fromJson(
    Map<String, dynamic> json, {
    required ItemType type,
  }) {
    return GithubResponse(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: (json['items'] as List)
          .map((item) => switch (type) {
                ItemType.repository => RepositoryItem.fromJson(item as Map<String, dynamic>),
              })
          .toList(),
    );
  }
}
