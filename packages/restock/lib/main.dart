import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';
import 'src/providers/package_info.dart';
import 'src/util/shared_preferences_service.dart';
import 'src/utils/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ビルド時に指定したFlavorを取得
  final flavor = EnumToString.fromString(
    Flavor.values,
    const String.fromEnvironment('FLAVOR'),
  )!;
  logger.fine('Flutter App Run Started by Flavor: $flavor');

  // Firebaseの初期化
  // Firebaseの各サービスを使う前に初期化を済ませておく必要がある
  await Firebase.initializeApp();

  return runApp(
    // ここ以下でProviderが使用可能
    ProviderScope(
      overrides: [
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
