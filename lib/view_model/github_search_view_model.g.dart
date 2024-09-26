// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_search_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentRepositoryHash() => r'aba163542e0913029185d0401cdc92fdc6d456c4';

/// See also [currentRepository].
@ProviderFor(currentRepository)
final currentRepositoryProvider = AutoDisposeProvider<RepositoryItem>.internal(
  currentRepository,
  name: r'currentRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentRepositoryRef = AutoDisposeProviderRef<RepositoryItem>;
String _$gitHubSearchViewModelHash() =>
    r'7c602b381139aa5a2c1e5d5ddf9a3648a0c87606';

/// See also [GitHubSearchViewModel].
@ProviderFor(GitHubSearchViewModel)
final gitHubSearchViewModelProvider = AutoDisposeAsyncNotifierProvider<
    GitHubSearchViewModel, List<SearchItem>>.internal(
  GitHubSearchViewModel.new,
  name: r'gitHubSearchViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gitHubSearchViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GitHubSearchViewModel = AutoDisposeAsyncNotifier<List<SearchItem>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
