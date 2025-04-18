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

  static const name = '/settings';
  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
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
    return const AccountPage();
  }
}
