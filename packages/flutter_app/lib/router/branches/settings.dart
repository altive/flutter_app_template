part of '../app_routes.dart';

// Shell Branch Data Classes
class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
}

// Route Data Classes
class SettingsRouteData extends GoRouteData with _$SettingsRouteData {
  const SettingsRouteData();

  static const name = '/settings';
  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

class ThemeSelectionRouteData extends GoRouteData
    with _$ThemeSelectionRouteData {
  const ThemeSelectionRouteData();

  static const name = '/theme-selection';
  static const path = 'theme-selection';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionPage();
  }
}

class AccountRouteData extends GoRouteData with _$AccountRouteData {
  const AccountRouteData();

  static const name = '/account';
  static const path = 'account';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}
