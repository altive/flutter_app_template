import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/onetaplog_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorName = String.fromEnvironment('FLAVOR');
  debugPrint(flavorName);

  runApp(const ProviderScope(child: OneTapLogApp()));
}
