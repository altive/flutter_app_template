part of '../app_routes.dart';

// Shell Branch Data Classes
class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

// Route Data Classes
class ExploreRouteData extends GoRouteData with _$ExploreRouteData {
  const ExploreRouteData();

  static const name = '/explore';
  static const path = '/explore';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExplorePage();
  }
}
