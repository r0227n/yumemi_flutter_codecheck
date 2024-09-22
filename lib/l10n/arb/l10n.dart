import 'package:flutter/widgets.dart' show BuildContext, Locale;
import '../arb/l10n.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension LocaleX on Locale {
  String toLabel(BuildContext context) => switch (languageCode) {
        'ja' => context.l10n.ja,
        'en' => context.l10n.en,
        _ => context.l10n.en,
      };
}

extension ListStringX on List<String> {
  /// Convert the elements of a list into a single sentence, separated by commas.
  ///
  /// e.g.
  /// - ['hoge', 'fuga'].labels => 'hoge, fuga'
  String get labels => join(', ');
}
