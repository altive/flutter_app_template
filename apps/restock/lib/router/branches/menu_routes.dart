import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/menu_page/menu_page.dart';
import '../../pages/theme_selection_page/theme_selection_page.dart';

class MenuShellBranchData extends StatefulShellBranchData {
  const MenuShellBranchData();
}

class MenuRouteData extends GoRouteData {
  const MenuRouteData();

  static const name = '/menu';
  static const path = '/menu';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MenuPage();
  }
}

class ThemeSelectionRouteData extends GoRouteData {
  const ThemeSelectionRouteData();

  static const name = '/theme-selection';
  static const path = 'theme-selection';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionPage();
  }
}

class AccountRouteData extends GoRouteData {
  const AccountRouteData();

  static const name = '/account';
  static const path = 'account';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // 一時的なプレースホルダーとして空のページを返します
    return Scaffold(
      appBar: AppBar(title: const Text('アカウント')),
      body: const Center(child: Text('アカウント設定ページ')),
    );
  }
}
