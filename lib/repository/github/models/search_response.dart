import 'search_item.dart';

enum SearchEntity {
  repositories,
}

/// GitHub API Response model
class SearchResponse {
  SearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<SearchItem> items;

  factory SearchResponse.fromJson(
    Map<String, dynamic> json, {
    required SearchEntity type,
  }) {
    return SearchResponse(
      totalCount: json['total_count'],
      incompleteResults: json['incomplete_results'],
      items: (json['items'] as List)
          .map((item) => switch (type) {
                SearchEntity.repositories => RepositoryItem.fromJson(item as Map<String, dynamic>),
              })
          .toList(),
    );
  }
}
