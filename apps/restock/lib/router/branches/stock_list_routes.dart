import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/stock_list_page/stock_list_page.dart';

class StockListShellBranchData extends StatefulShellBranchData {
  const StockListShellBranchData();
}

class StockListRouteData extends GoRouteData {
  const StockListRouteData();

  static const name = 'stockList';
  static const path = '/stock-list';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const StockListPage();
  }
}
