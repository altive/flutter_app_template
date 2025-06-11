import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/explore/view/explore_page.dart';
import '../features/pub_dev_packages/view/pub_dev_packages_page.dart';
import '../pages/account/account_page.dart';
import '../pages/app_info_page/app_info_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/main/main_page.dart';
import '../pages/riverpod_example_page/async_notifier_provider_page/async_notifier_provider_page.dart';
import '../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../pages/riverpod_example_page/notifier_provider_page/notifier_provider_page.dart';
import '../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../pages/riverpod_example_page/riverpod_example_page.dart';
import '../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../pages/riverpod_example_page/stream_provider_page.dart/stream_provider_page.dart';
import '../pages/settings_page/settings_page.dart';
import '../pages/theme_selection_page/theme_selection_page.dart';

part 'app_routes.g.dart';
part 'branches/dashboard.dart';
part 'branches/explore.dart';
part 'branches/home.dart';
part 'branches/pub_dev_packages.dart';
part 'branches/settings.dart';

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
    TypedStatefulShellBranch<PubDevPackagesShellBranchData>(
      routes: [
        TypedGoRoute<PubDevPackagesRouteData>(
          name: PubDevPackagesRouteData.name,
          path: PubDevPackagesRouteData.path,
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
