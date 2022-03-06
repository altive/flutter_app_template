import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'commons/providers/flavor_provider.dart';
import 'commons/providers/package_info_provider.dart';
import 'commons/providers/shared_preferences_provider.dart';
import 'presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');

  late final SharedPreferences sp;
  late final PackageInfo pi;
  await Future.wait([
    Future(Firebase.initializeApp),
    Future(() async => sp = await SharedPreferences.getInstance()),
    Future(() async => pi = await PackageInfo.fromPlatform()),
  ]);

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(FlavorFromString.call(flavor)),
        sharedPreferencesProvider.overrideWithValue(sp),
        packageInfoProvider.overrideWithValue(pi),
      ],
      child: const App(),
    ),
  );
}
