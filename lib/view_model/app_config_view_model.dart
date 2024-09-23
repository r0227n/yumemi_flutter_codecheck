import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../repository/config/app_config.dart';

part 'app_config_view_model.g.dart';

typedef AppConfigValue = ({
  Locale locale,
});

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences<SharedPreferences>(SharedPreferencesRef ref) =>
    throw UnimplementedError();

@riverpod
class AppConfigViewModel extends _$AppConfigViewModel {
  @override
  AppConfigValue build() {
    config = AppConfig();
    return (locale: Locale(getLanguageCode() ?? AppConfig.defaultLocale));
  }

  late final AppConfig config;

  AppConfigValue copyWith({
    Locale? locale,
  }) {
    return (locale: locale ?? state.locale);
  }

  String? getLanguageCode() {
    final prefs = ref.read(sharedPreferencesProvider);

    return prefs.getString(AppConfig.languageCodeConfigKey);
  }

  Future<bool> updateLocale(Locale newLocale) async {
    final prefs = ref.read(sharedPreferencesProvider);

    return config
        .update(
          prefs,
          key: AppConfig.languageCodeConfigKey,
          value: newLocale.languageCode,
        )
        .whenComplete(() => state = copyWith(locale: newLocale));
  }
}
