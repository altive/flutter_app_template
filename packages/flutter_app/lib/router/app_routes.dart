import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/app_info_page/app_info_page.dart';
import '../../pages/home_page/home_page.dart';
import '../../pages/riverpod_example_page/async_notifier_provider_page/async_notifier_provider_page.dart';
import '../../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../../pages/riverpod_example_page/notifier_provider_page/notifier_provider_page.dart';
import '../../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../../pages/riverpod_example_page/riverpod_example_page.dart';
import '../../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../../pages/riverpod_example_page/stream_provider_page.dart/stream_provider_page.dart';
import '../features/explore/view/explore_page.dart';
import '../features/pub_dev_packages/view/pub_dev_packages_page.dart';
import '../pages/account/account_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/main/main_page.dart';
import '../pages/settings_page/settings_page.dart';
import '../pages/theme_selection_page/theme_selection_page.dart';

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

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRouteData extends GoRouteData with $HomeRouteData {
  const HomeRouteData();

  static const name = '/home';
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData with $AppInfoRouteData {
  const AppInfoRouteData();

  static const name = '/app-info';
  static const path = 'app-info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}

class RiverpodExampleRouteData extends GoRouteData
    with $RiverpodExampleRouteData {
  const RiverpodExampleRouteData();

  static const name = '/riverpod';
  static const path = 'riverpod';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodExamplePage();
  }
}

class ProviderRouteData extends GoRouteData with $ProviderRouteData {
  const ProviderRouteData();

  static const name = '/provider';
  static const path = 'provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProviderPage();
}

class StateProviderRouteData extends GoRouteData with $StateProviderRouteData {
  const StateProviderRouteData();

  static const name = '/state-provider';
  static const path = 'state-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateProviderPage();
}

class StreamProviderRouteData extends GoRouteData
    with $StreamProviderRouteData {
  const StreamProviderRouteData();

  static const name = '/stream-provider';
  static const path = 'stream-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StreamProviderPage();
}

class NotifierProviderRouteData extends GoRouteData
    with $NotifierProviderRouteData {
  const NotifierProviderRouteData();

  static const name = '/notifier-provider';
  static const path = 'notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotifierProviderPage();
}

class AsyncNotifierProviderRouteData extends GoRouteData
    with $AsyncNotifierProviderRouteData {
  const AsyncNotifierProviderRouteData();

  static const name = '/async-notifier-provider';
  static const path = 'async-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AsyncNotifierProviderPage();
}

class StateNotifierProviderRouteData extends GoRouteData
    with $StateNotifierProviderRouteData {
  const StateNotifierProviderRouteData();

  static const name = '/state-notifier-provider';
  static const path = 'state-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateNotifierProviderPage();
}

class ListenProviderRouteData extends GoRouteData
    with $ListenProviderRouteData {
  const ListenProviderRouteData();

  static const name = '/listen-provider';
  static const path = 'listen-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListenProviderPage();
}

class DashboardShellBranchData extends StatefulShellBranchData {
  const DashboardShellBranchData();
}

class DashboardRouteData extends GoRouteData with $DashboardRouteData {
  const DashboardRouteData();

  static const name = '/dashboard';
  static const path = '/dashboard';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
}

class SettingsRouteData extends GoRouteData with $SettingsRouteData {
  const SettingsRouteData();

  static const name = '/settings';
  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

class ThemeSelectionRouteData extends GoRouteData
    with $ThemeSelectionRouteData {
  const ThemeSelectionRouteData();

  static const name = '/theme-selection';
  static const path = 'theme-selection';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionPage();
  }
}

class AccountRouteData extends GoRouteData with $AccountRouteData {
  const AccountRouteData();

  static const name = '/account';
  static const path = 'account';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

class ExploreRouteData extends GoRouteData with $ExploreRouteData {
  const ExploreRouteData();

  static const name = '/explore';
  static const path = '/explore';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExplorePage();
  }
}

class PubDevPackagesShellBranchData extends StatefulShellBranchData {
  const PubDevPackagesShellBranchData();
}

class PubDevPackagesRouteData extends GoRouteData
    with $PubDevPackagesRouteData {
  const PubDevPackagesRouteData();

  static const name = '/pub_dev_packages';
  static const path = '/pub_dev_packages';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PubDevPackagesPage();
  }
}
