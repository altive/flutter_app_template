import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/app_info_page/app_info_page.dart';
import '../../pages/home_page/home_page.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  static const name = '/home';
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData {
  const AppInfoRouteData();

  static const name = '/appInfo';
  static const path = 'app-info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}
