import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../pages/app_info_page/app_info_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/not_found_page/not_found_page.dart';
import '../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../pages/riverpod_example_page/riverpod_example_page.dart';
import '../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../pages/settings_page/settings_page.dart';
import '../pages/tab_scaffold_page/tab_scaffold_page.dart';
import '../pages/theme_selection_page/theme_selection_page.dart';

// TODO(Riscait): Migrate to `go_router`
final routeMapProvider = Provider((ref) {
  return RouteMap(
    onUnknownRoute: (path) {
      return MaterialPage<void>(child: NotFoundPage(path));
    },
    routes: {
      // Root
      '/': (route) => const CupertinoTabPage(
            child: TabScaffoldPage(),
            paths: [
              '/${HomePage.routeName}',
              '/${RiverpodExamplePage.routeName}',
              '/${SettingsPage.routeName}',
            ],
          ),
      // Home
      '/${HomePage.routeName}': (route) =>
          const MaterialPage<void>(child: HomePage()),
      // Home / App info
      '/${HomePage.routeName}/${AppInfoPage.routeName}': (route) =>
          const MaterialPage<void>(child: AppInfoPage()),
      // Home / Theme selector
      '/${HomePage.routeName}/${ThemeSelectionPage.routeName}': (route) =>
          const MaterialPage<void>(child: ThemeSelectionPage()),
      // Riverpod example
      '/${RiverpodExamplePage.routeName}': (route) =>
          const MaterialPage<void>(child: RiverpodExamplePage()),
      // Riverpod example / Provider
      '/${RiverpodExamplePage.routeName}/${ProviderPage.routeName}': (route) =>
          const MaterialPage<void>(child: ProviderPage()),
      // Riverpod example / StateProviderPage
      '/${RiverpodExamplePage.routeName}/${StateProviderPage.routeName}':
          (route) => const MaterialPage<void>(child: StateProviderPage()),
      // Riverpod example / StateNotifierProviderPage
      '/${RiverpodExamplePage.routeName}/${StateNotifierProviderPage.routeName}':
          (route) =>
              const MaterialPage<void>(child: StateNotifierProviderPage()),
      // Riverpod example / ListenProviderPage
      '/${RiverpodExamplePage.routeName}/${ListenProviderPage.routeName}':
          (route) => const MaterialPage<void>(child: ListenProviderPage()),
      // Settings
      '/${SettingsPage.routeName}': (route) =>
          const MaterialPage<void>(child: SettingsPage()),
    },
  );
});
