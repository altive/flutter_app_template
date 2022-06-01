import 'package:flutter/material.dart';

import 'components/home_app_bar.dart';
import 'components/home_body.dart';

/// デモ機能をリスト表示する
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}