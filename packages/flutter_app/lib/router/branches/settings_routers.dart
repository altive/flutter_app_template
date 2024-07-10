import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/account/account_page.dart';
import '../../pages/settings_page/settings_page.dart';
import '../../pages/theme_selection_page/theme_selection_page.dart';

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  static const String name = '/settings';
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

class ThemeSelectionRouteData extends GoRouteData {
  const ThemeSelectionRouteData();

  static const String name = '/theme-selection';
  static const String path = 'theme-selection';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionPage();
  }
}

class AccountRouteData extends GoRouteData {
  const AccountRouteData();

  static const String name = '/account';
  static const String path = 'account';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}
