import 'package:flutter/material.dart';

import 'homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL playground',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
