import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Displays a [LicensePage], which shows licenses for software used by the
/// application.
///
/// Be sure to add this line if `PackageInfo.fromPlatform()` is called before runApp()
/// `WidgetsFlutterBinding.ensureInitialized();`

/// The application arguments correspond to the properties on [LicensePage].
///
/// The `context` argument is used to look up the [Navigator] for the page.
///
/// The `useRootNavigator` argument is used to determine whether to push the
/// page to the [Navigator] furthest from or nearest to the given `context`. It
/// is `false` by default.
///
/// If the application has a [Drawer], consider using [AboutListTile] instead
/// of calling this directly.
///
/// The [AboutDialog] shown by [showAboutDialog] includes a button that calls
/// [showLicensePage].
///
/// The licenses shown on the [LicensePage] are those returned by the
/// [LicenseRegistry] API, which can be used to add more licenses to the list.
Future<void> showLicense({
  required BuildContext context,
  String? applicationName,
  String? applicationVersion,
  Widget? applicationIcon,
  String? applicationLegalese,
  bool useRootNavigator = false,
}) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  // ignore: use_build_context_synchronously
  Navigator.of(context, rootNavigator: useRootNavigator).push(MaterialPageRoute<void>(
    builder: (BuildContext context) => LicensePage(
      applicationName: applicationName ?? packageInfo.appName,
      applicationVersion: applicationVersion ?? packageInfo.version,
      applicationIcon: applicationIcon,
      applicationLegalese: applicationLegalese,
    ),
  ));
}
