import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/pub_dev_packages/view/pub_dev_packages_page.dart';

class PubDevPackagesShellBranchData extends StatefulShellBranchData {
  const PubDevPackagesShellBranchData();
}

class PubDevPackagesRouteData extends GoRouteData {
  const PubDevPackagesRouteData();

  static const String name = '/pub_dev_packages';
  static const String path = '/pub_dev_packages';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PubDevPackagesPage();
  }
}
