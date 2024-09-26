// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gitHubRepoHash() => r'4b873a5ad77138fd714bb5e11fec1b74a529bb20';

/// See also [gitHubRepo].
@ProviderFor(gitHubRepo)
final gitHubRepoProvider = AutoDisposeProvider<GitHubRepoRepository>.internal(
  gitHubRepo,
  name: r'gitHubRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gitHubRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GitHubRepoRef = AutoDisposeProviderRef<GitHubRepoRepository>;
String _$repositoryDetailHash() => r'80d25708bc3d76fa939634b27c8595e4009cb797';

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
    String fullName,
  ) {
    return RepositoryDetailProvider(
      fullName,
    );
  }

  @override
  RepositoryDetailProvider getProviderOverride(
    covariant RepositoryDetailProvider provider,
  ) {
    return call(
      provider.fullName,
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
    String fullName,
  ) : this._internal(
          (ref) => repositoryDetail(
            ref as RepositoryDetailRef,
            fullName,
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
          fullName: fullName,
        );

  RepositoryDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fullName,
  }) : super.internal();

  final String fullName;

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
        fullName: fullName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RepositoryDetail> createElement() {
    return _RepositoryDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RepositoryDetailProvider && other.fullName == fullName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fullName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RepositoryDetailRef on AutoDisposeFutureProviderRef<RepositoryDetail> {
  /// The parameter `fullName` of this provider.
  String get fullName;
}

class _RepositoryDetailProviderElement
    extends AutoDisposeFutureProviderElement<RepositoryDetail>
    with RepositoryDetailRef {
  _RepositoryDetailProviderElement(super.provider);

  @override
  String get fullName => (origin as RepositoryDetailProvider).fullName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
