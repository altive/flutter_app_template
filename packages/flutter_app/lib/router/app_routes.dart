import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/explore/view/explore_page.dart';
import '../features/post/view/post_page.dart';
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

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          path: HomeShellBranchData.path,
          routes: [
            TypedGoRoute<AppInfoRouteData>(path: 'app-info'),
            TypedGoRoute<RiverpodExampleRouteData>(
              path: 'riverpod',
              routes: [
                TypedGoRoute<ProviderRouteData>(path: 'provider'),
                TypedGoRoute<StateProviderRouteData>(path: 'state-provider'),
                TypedGoRoute<StreamProviderRouteData>(path: 'stream-provider'),
                TypedGoRoute<NotifierProviderRouteData>(
                  path: 'notifier-provider',
                ),
                TypedGoRoute<AsyncNotifierProviderRouteData>(
                  path: 'async-notifier-provider',
                ),
                TypedGoRoute<StateNotifierProviderRouteData>(
                  path: 'state-notifier-provider',
                ),
                TypedGoRoute<ListenProviderRouteData>(path: 'listen-provider'),
              ],
            ),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<ExploreShellBranchData>(
      routes: [
        TypedGoRoute<ExploreRouteData>(
          path: ExploreShellBranchData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<PostShellBranchData>(
      routes: [
        TypedGoRoute<PostRouteData>(
          path: PostShellBranchData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<DashboardShellBranchData>(
      routes: [
        TypedGoRoute<DashboardRouteData>(
          path: DashboardShellBranchData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsShellBranchData>(
      routes: [
        TypedGoRoute<SettingsRouteData>(
          path: SettingsShellBranchData.path,
          routes: [
            TypedGoRoute<ThemeSelectionRouteData>(path: 'theme-selection'),
            TypedGoRoute<AccountRouteData>(path: 'account'),
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
  static const String path = '/home';
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData {
  const AppInfoRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}

class RiverpodExampleRouteData extends GoRouteData {
  const RiverpodExampleRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodExamplePage();
  }
}

class ProviderRouteData extends GoRouteData {
  const ProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProviderPage();
}

class StateProviderRouteData extends GoRouteData {
  const StateProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateProviderPage();
}

class StreamProviderRouteData extends GoRouteData {
  const StreamProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StreamProviderPage();
}

class NotifierProviderRouteData extends GoRouteData {
  const NotifierProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotifierProviderPage();
}

class AsyncNotifierProviderRouteData extends GoRouteData {
  const AsyncNotifierProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AsyncNotifierProviderPage();
}

class StateNotifierProviderRouteData extends GoRouteData {
  const StateNotifierProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateNotifierProviderPage();
}

class ListenProviderRouteData extends GoRouteData {
  const ListenProviderRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListenProviderPage();
}

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
  static const String path = '/explore';
}

class ExploreRouteData extends GoRouteData {
  const ExploreRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExplorePage();
  }
}

class PostShellBranchData extends StatefulShellBranchData {
  const PostShellBranchData();
  static const String path = '/post';
}

class PostRouteData extends GoRouteData {
  const PostRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PostPage();
  }
}

class DashboardShellBranchData extends StatefulShellBranchData {
  const DashboardShellBranchData();
  static const String path = '/dashboard';
}

class DashboardRouteData extends GoRouteData {
  const DashboardRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
  static const String path = '/settings';
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

class ThemeSelectionRouteData extends GoRouteData {
  const ThemeSelectionRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionPage();
  }
}

class AccountRouteData extends GoRouteData {
  const AccountRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}
