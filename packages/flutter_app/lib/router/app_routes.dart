import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/initialization_page.dart';
import '../pages/main/main_page.dart';
import 'branches/branches.dart';

part 'app_routes.g.dart';

@TypedGoRoute<InitializationRoute>(
  name: InitializationRoute.name,
  path: InitializationRoute.path,
)
class InitializationRoute extends GoRouteData {
  const InitializationRoute();

  static const String name = '/init';
  static const String path = '/init';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: InitializationPage());
  }
}

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
            TypedGoRoute<RiverpodExampleRouteData>(
              name: RiverpodExampleRouteData.name,
              path: RiverpodExampleRouteData.path,
              routes: [
                TypedGoRoute<ProviderRouteData>(
                  name: ProviderRouteData.name,
                  path: ProviderRouteData.path,
                ),
                TypedGoRoute<StateProviderRouteData>(
                  name: StateProviderRouteData.name,
                  path: StateProviderRouteData.path,
                ),
                TypedGoRoute<StreamProviderRouteData>(
                  name: StreamProviderRouteData.name,
                  path: StreamProviderRouteData.path,
                ),
                TypedGoRoute<NotifierProviderRouteData>(
                  name: NotifierProviderRouteData.name,
                  path: NotifierProviderRouteData.path,
                ),
                TypedGoRoute<AsyncNotifierProviderRouteData>(
                  name: AsyncNotifierProviderRouteData.name,
                  path: AsyncNotifierProviderRouteData.path,
                ),
                TypedGoRoute<StateNotifierProviderRouteData>(
                  name: StateNotifierProviderRouteData.name,
                  path: StateNotifierProviderRouteData.path,
                ),
                TypedGoRoute<ListenProviderRouteData>(
                  name: ListenProviderRouteData.name,
                  path: ListenProviderRouteData.path,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ExploreShellBranchData>(
      routes: [
        TypedGoRoute<ExploreRouteData>(
          name: ExploreRouteData.name,
          path: ExploreRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<PostShellBranchData>(
      routes: [
        TypedGoRoute<PostRouteData>(
          name: PostRouteData.name,
          path: PostRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<DashboardShellBranchData>(
      routes: [
        TypedGoRoute<DashboardRouteData>(
          name: DashboardRouteData.name,
          path: DashboardRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsShellBranchData>(
      routes: [
        TypedGoRoute<SettingsRouteData>(
          name: SettingsRouteData.name,
          path: SettingsRouteData.path,
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
