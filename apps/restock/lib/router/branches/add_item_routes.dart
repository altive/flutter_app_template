import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/add_item_page/add_item_page.dart';

class AddItemShellBranchData extends StatefulShellBranchData {
  const AddItemShellBranchData();
}

class AddItemRouteData extends GoRouteData {
  const AddItemRouteData();

  static const name = 'addItem';
  static const path = '/add-item';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddItemPage();
  }
}
