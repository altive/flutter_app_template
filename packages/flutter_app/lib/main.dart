import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';
import 'features/user_device/user_device.dart';
import 'flutter_app.dart';
import 'util/providers/package_info_provider.dart';
import 'util/providers/shared_preferences_provider.dart';

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

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        packageInfoProvider.overrideWithValue(packageInfo),
        userDeviceProvider.overrideWithValue(userDevice),
      ],
      child: const FlutterApp(),
    ),
  );
}
