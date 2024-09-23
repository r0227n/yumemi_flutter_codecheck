// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gitHubRepoHash() => r'd11b6edba56db2ccab6b83d5645fea58d67b1e41';

/// See also [gitHubRepo].
@ProviderFor(gitHubRepo)
final gitHubRepoProvider = AutoDisposeProvider<GithubRepoRepository>.internal(
  gitHubRepo,
  name: r'gitHubRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gitHubRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GitHubRepoRef = AutoDisposeProviderRef<GithubRepoRepository>;
String _$repositoryDetailHash() => r'8980a805dc7dc690672f7c8e0e222a67b43651ce';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [repositoryDetail].
@ProviderFor(repositoryDetail)
const repositoryDetailProvider = RepositoryDetailFamily();

/// See also [repositoryDetail].
class RepositoryDetailFamily extends Family<AsyncValue<RepositoryDetail>> {
  /// See also [repositoryDetail].
  const RepositoryDetailFamily();

  /// See also [repositoryDetail].
  RepositoryDetailProvider call(
    String fullname,
  ) {
    return RepositoryDetailProvider(
      fullname,
    );
  }

  @override
  RepositoryDetailProvider getProviderOverride(
    covariant RepositoryDetailProvider provider,
  ) {
    return call(
      provider.fullname,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'repositoryDetailProvider';
}

/// See also [repositoryDetail].
class RepositoryDetailProvider
    extends AutoDisposeFutureProvider<RepositoryDetail> {
  /// See also [repositoryDetail].
  RepositoryDetailProvider(
    String fullname,
  ) : this._internal(
          (ref) => repositoryDetail(
            ref as RepositoryDetailRef,
            fullname,
          ),
          from: repositoryDetailProvider,
          name: r'repositoryDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$repositoryDetailHash,
          dependencies: RepositoryDetailFamily._dependencies,
          allTransitiveDependencies:
              RepositoryDetailFamily._allTransitiveDependencies,
          fullname: fullname,
        );

  RepositoryDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullname,
  }) : super.internal();

  final String fullname;

  @override
  Override overrideWith(
    FutureOr<RepositoryDetail> Function(RepositoryDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RepositoryDetailProvider._internal(
        (ref) => create(ref as RepositoryDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fullname: fullname,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RepositoryDetail> createElement() {
    return _RepositoryDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepositoryDetailProvider && other.fullname == fullname;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullname.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepositoryDetailRef on AutoDisposeFutureProviderRef<RepositoryDetail> {
  /// The parameter `fullname` of this provider.
  String get fullname;
}

class _RepositoryDetailProviderElement
    extends AutoDisposeFutureProviderElement<RepositoryDetail>
    with RepositoryDetailRef {
  _RepositoryDetailProviderElement(super.provider);

  @override
  String get fullname => (origin as RepositoryDetailProvider).fullname;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
