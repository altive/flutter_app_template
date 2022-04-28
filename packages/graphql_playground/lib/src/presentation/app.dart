import 'package:flutter/material.dart';

import 'homepage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL playground',
      theme: ThemeData(),
      home: const HomePage(),
    );
  }
}
