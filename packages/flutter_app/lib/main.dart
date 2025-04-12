import 'dart:isolate';

import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';
import 'gen/strings.g.dart';
import 'main_app.dart';
import 'package_adaptor/tracker_provider.dart';
import 'util/logger/provider_logger.dart';
import 'util/providers/shared_preferences_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(appFlavor!);

  // If only programmer error occurs, initialize within main().
  // If other exceptions may occur, initialize using initializationProvider.
  await Firebase.initializeApp(options: firebaseOptionsWithFlavor(flavor));

  final tracker = Tracker();
  // Record errors caught by the Flutter SDK.
  FlutterError.onError = tracker.onFlutterError;
  // Log asynchronous errors not caught by the Flutter SDK.
  PlatformDispatcher.instance.onError = tracker.onPlatformError;
  if (!kIsWeb) {
    // Record errors external to Flutter SDK.
    Isolate.current.addErrorListener(tracker.isolateErrorListener());
  }

  final (sp, _) =
      await (
        // Get it here because you want to use Preferences before Initialize.
        SharedPreferences.getInstance(),
        LocaleSettings.useDeviceLocale(),
      ).wait;

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        trackerProvider.overrideWithValue(tracker),
        sharedPreferencesProvider.overrideWithValue(sp),
      ],
      observers: [ProviderLogger()],
      child: TranslationProvider(child: const MainApp()),
    ),
  );
}
