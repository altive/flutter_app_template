part of '../app_routes.dart';

// Shell Branch Data Classes
class DashboardShellBranchData extends StatefulShellBranchData {
  const DashboardShellBranchData();
}

// Route Data Classes
class DashboardRouteData extends GoRouteData with _$DashboardRouteData {
  const DashboardRouteData();

  static const name = '/dashboard';
  static const path = '/dashboard';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}
