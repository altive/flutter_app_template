import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/environment.dart';
import 'src/providers/package_info.dart';
import 'src/util/shared_preferences_service.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final flavor = Flavor.values.byName(const String.fromEnvironment('FLAVOR'));

  const environment = Environment();

  await Future.wait<void>([
    Firebase.initializeApp(),
    environment.initialize(),
  ]);

  return runApp(
    ProviderScope(
      overrides: [
        environmentProvider.overrideWithValue(environment),
        flavorProvider.overrideWithValue(flavor),
        packageInfoProvider.overrideWithValue(await PackageInfo.fromPlatform()),
        sharedPreferencesServiceProvider.overrideWithValue(
          SharedPreferencesService(await SharedPreferences.getInstance()),
        ),
      ],
      child: const App(),
    ),
  );
}
