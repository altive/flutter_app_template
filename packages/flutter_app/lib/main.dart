import 'dart:isolate';

import 'package:analysis_logger/analysis_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';
import 'features/user_device/user_device.dart';
import 'flutter_app.dart';
import 'package_adaptor/analysis_logger/analysis_logger_provider.dart';
import 'util/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorName = String.fromEnvironment('flavor');
  final flavor = Flavor.values.byName(flavorName);

  final (_, sharedPreferences, packageInfo, userDevice) = await (
    Firebase.initializeApp(options: firebaseOptionsWithFlavor(flavor)),
    SharedPreferences.getInstance(),
    PackageInfo.fromPlatform(),
    retrieveUserDevice(),
  ).wait;

  final analyticsReporter = AnalysisLogger();
  // Flutterフレームワークがキャッチしたエラーを記録する。
  FlutterError.onError = analyticsReporter.onFlutterError;
  // Flutterフレームワークでキャッチできない非同期エラーを記録する。
  PlatformDispatcher.instance.onError = analyticsReporter.onPlatformError;
  // Flutter外部のエラーを記録する。
  Isolate.current.addErrorListener(analyticsReporter.isolateErrorListener());

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        packageInfoProvider.overrideWithValue(packageInfo),
        userDeviceProvider.overrideWithValue(userDevice),
        analysisLoggerProvider.overrideWithValue(analyticsReporter),
      ],
      child: const FlutterApp(),
    ),
  );
}
