import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/explore/view/explore_page.dart';

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

class ExploreRouteData extends GoRouteData {
  const ExploreRouteData();

  static const name = '/explore';
  static const path = '/explore';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExplorePage();
  }
}
