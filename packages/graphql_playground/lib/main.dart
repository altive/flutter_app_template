import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/environment/environment.dart';
import 'src/presentation/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = Environment();
  await Future.wait([
    environment.load(),
  ]);

  runApp(ProviderScope(
    overrides: [
      environmentProvider.overrideWithValue(environment),
    ],
    child: const App(),
  ));
}
