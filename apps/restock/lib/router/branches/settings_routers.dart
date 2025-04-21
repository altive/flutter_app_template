import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/my_page/my_page.dart';
import '../../pages/theme_selection_page/theme_selection_page.dart';

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  static const name = '/myPage';
  static const path = '/my-page';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyPage();
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
