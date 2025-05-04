import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/main/main_page.dart';
import 'branches/branches.dart';

part 'app_routes.g.dart';

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          name: HomeRouteData.name,
          path: HomeRouteData.path,
          routes: [
            TypedGoRoute<AppInfoRouteData>(
              name: AppInfoRouteData.name,
              path: AppInfoRouteData.path,
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<StockListShellBranchData>(
      routes: [
        TypedGoRoute<StockListRouteData>(
          name: StockListRouteData.name,
          path: StockListRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<AddItemShellBranchData>(
      routes: [
        TypedGoRoute<AddItemRouteData>(
          name: AddItemRouteData.name,
          path: AddItemRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<MenuShellBranchData>(
      routes: [
        TypedGoRoute<MenuRouteData>(
          name: MenuRouteData.name,
          path: MenuRouteData.path,
          routes: [
            TypedGoRoute<ThemeSelectionRouteData>(
              name: ThemeSelectionRouteData.name,
              path: ThemeSelectionRouteData.path,
            ),
            TypedGoRoute<AccountRouteData>(
              name: AccountRouteData.name,
              path: AccountRouteData.path,
            ),
          ],
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPage(navigationShell: navigationShell);
  }
}
