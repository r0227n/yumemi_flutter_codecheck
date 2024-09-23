// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'd9addeb25da8598502527e26e3459367d131eb40';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider = Provider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SharedPreferencesRef = ProviderRef<SharedPreferences>;
String _$appConfigViewModelHash() =>
    r'1c569a18ba7be7f63b868c4b6a725d2fe3f17611';

/// See also [AppConfigViewModel].
@ProviderFor(AppConfigViewModel)
final appConfigViewModelProvider =
    AutoDisposeNotifierProvider<AppConfigViewModel, AppConfigValue>.internal(
  AppConfigViewModel.new,
  name: r'appConfigViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appConfigViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppConfigViewModel = AutoDisposeNotifier<AppConfigValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
