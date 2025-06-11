part of '../app_routes.dart';

// Shell Branch Data Classes
class PubDevPackagesShellBranchData extends StatefulShellBranchData {
  const PubDevPackagesShellBranchData();
}

// Route Data Classes
class PubDevPackagesRouteData extends GoRouteData
    with _$PubDevPackagesRouteData {
  const PubDevPackagesRouteData();

  static const name = '/pub_dev_packages';
  static const path = '/pub_dev_packages';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PubDevPackagesPage();
  }
}
