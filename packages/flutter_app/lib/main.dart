import 'dart:isolate';

import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';
import 'features/user_device/user_device.dart';
import 'flutter_app.dart';
import 'gen/strings.g.dart';
import 'package_adaptor/tracker_provider.dart';
import 'util/logger/provider_logger.dart';
import 'util/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));

  final (_, sharedPreferences, packageInfo, userDevice) = await (
    Firebase.initializeApp(options: firebaseOptionsWithFlavor(flavor)),
    SharedPreferences.getInstance(),
    PackageInfo.fromPlatform(),
    retrieveUserDevice(),
  ).wait;

  final tracker = Tracker();
  // Flutterフレームワークがキャッチしたエラーを記録する。
  FlutterError.onError = tracker.onFlutterError;
  // Flutterフレームワークでキャッチできない非同期エラーを記録する。
  PlatformDispatcher.instance.onError = tracker.onPlatformError;
  // Flutter外部のエラーを記録する。
  Isolate.current.addErrorListener(tracker.isolateErrorListener());

  LocaleSettings.useDeviceLocale();

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        packageInfoProvider.overrideWithValue(packageInfo),
        userDeviceProvider.overrideWithValue(userDevice),
        trackerProvider.overrideWithValue(tracker),
      ],
      observers: [ProviderLogger()],
      child: TranslationProvider(
        child: const FlutterApp(),
      ),
    ),
  );
}
