import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../providers/github_provider.dart';

import '../repository/github.dart';

part 'github_search_view_model.g.dart';

@riverpod
RepositoryItem currentRepository(CurrentRepositoryRef ref) => throw UnimplementedError();

@riverpod
class GitHubSearchViewModel extends _$GitHubSearchViewModel {
  @override
  FutureOr<List<SearchItem>> build() {
    repoRepository = ref.watch(gitHubRepoProvider);

    return Future.value(const []);
  }

  late final GithubRepoRepository repoRepository;

  Future<void> searchRepository(String keyword) async {
    state = const AsyncLoading();
    if (keyword.isNotEmpty) {
      state = await AsyncValue.guard(
        () => repoRepository.search(keyword).then((value) => value.items),
      );
    } else {
      state = const AsyncData([]);
    }
  }
}
