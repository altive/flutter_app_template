import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/add_item_page/add_item_page.dart';

class PubDevPackagesShellBranchData extends StatefulShellBranchData {
  const PubDevPackagesShellBranchData();
}

class PubDevPackagesRouteData extends GoRouteData {
  const PubDevPackagesRouteData();

  static const name = 'addItem';
  static const path = '/add-item';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddItemPage();
  }
}
