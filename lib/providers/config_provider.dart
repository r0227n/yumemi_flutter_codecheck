import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences<SharedPreferences>(SharedPreferencesRef ref) =>
    throw UnimplementedError();
