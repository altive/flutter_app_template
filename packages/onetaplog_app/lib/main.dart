import 'package:flutter/material.dart';

import 'src/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  const flavorName = String.fromEnvironment('FLAVOR');
  debugPrint(flavorName);

  runApp(const MyApp());
}
