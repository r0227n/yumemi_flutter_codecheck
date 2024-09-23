import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static const String defaultLocale = 'en';
  static const String languageCodeConfigKey = 'language_code_config_key';

  Future<bool> update(
    SharedPreferences prefs, {
    required String key,
    required Object value,
  }) async {
    return switch (value) {
      bool() => prefs.setBool(key, value),
      double() => prefs.setDouble(key, value),
      int() => prefs.setInt(key, value),
      String() => prefs.setString(key, value),
      List<String>() => prefs.setStringList(key, value),
      _ => throw UnimplementedError(),
    };
  }
}
