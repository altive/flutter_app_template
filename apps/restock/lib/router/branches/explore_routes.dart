import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/stock_list_page/stock_list_page.dart';

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

class ExploreRouteData extends GoRouteData {
  const ExploreRouteData();

  static const name = 'stockList';
  static const path = '/stock-list';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StockListPage();
  }
}
