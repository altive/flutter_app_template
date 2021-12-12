import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../app_info_page/app_info_page.dart';
import '../home_page/home_page.dart';
import '../not_found_page/not_found_page.dart';
import '../ranking_detail_page/ranking_detail_page.dart';
import '../ranking_edit_page/ranking_edit_page.dart';
import '../ranking_list_page/ranking_list_page.dart';
import '../riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../riverpod_example_page/provider_page/provider_page.dart';
import '../riverpod_example_page/riverpod_example_page.dart';
import '../riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../settings_page/settings_page.dart';
import '../tab_scaffold_page/tab_scaffold_page.dart';
import '../theme_selection_page/theme_selection_page.dart';

final routeMapProvider = Provider((ref) {
  return RouteMap(
    onUnknownRoute: (path) {
      return MaterialPage<void>(child: NotFoundPage(path));
    },
    routes: {
      // Root
      '/': (route) => const CupertinoTabPage(
            child: TabScaffoldPage(),
            paths: ['/home', '/settings'],
          ),
      // Home
      '/${HomePage.routeName}': (route) =>
          const MaterialPage<void>(child: HomePage()),
      // Home / App info
      '/${HomePage.routeName}/app-info': (route) =>
          const MaterialPage<void>(child: AppInfoPage()),
      // Home / Theme selector
      '/${HomePage.routeName}/${ThemeSelectionPage.routeName}': (route) =>
          const MaterialPage<void>(child: ThemeSelectionPage()),
      // Home / Riverpod examples
      '/${HomePage.routeName}/${RiverpodExamplePage.routeName}': (route) =>
          const MaterialPage<void>(child: RiverpodExamplePage()),
      '/${HomePage.routeName}/${RiverpodExamplePage.routeName}/${ProviderPage.routeName}':
          (route) => const MaterialPage<void>(child: ProviderPage()),
      '/${HomePage.routeName}/${RiverpodExamplePage.routeName}/${StateProviderPage.routeName}':
          (route) => const MaterialPage<void>(child: StateProviderPage()),
      '/${HomePage.routeName}/${RiverpodExamplePage.routeName}/${StateNotifierProviderPage.routeName}':
          (route) =>
              const MaterialPage<void>(child: StateNotifierProviderPage()),
      '/${HomePage.routeName}/${RiverpodExamplePage.routeName}/${ListenProviderPage.routeName}':
          (route) => const MaterialPage<void>(child: ListenProviderPage()),
      // Home / Rankings
      '/${HomePage.routeName}/${RankingListPage.routeName}': (_) =>
          const MaterialPage<void>(child: RankingListPage()),
      // Home / Rankings / Ranking detail
      '/${HomePage.routeName}/${RankingListPage.routeName}/${RankingDetailPage.routeName}/:id':
          (route) {
        final id = route.pathParameters['id'];
        if (id == null) {
          return const NotFound();
        }
        return MaterialPage<void>(
          child: RankingDetailPage(
            rankingId: id,
          ),
        );
      },
      // Home / Rankings / Create Ranking
      // 未使用
      '/${HomePage.routeName}/${RankingListPage.routeName}/${RankingEditPage.routeName}':
          (route) {
        return const MaterialPage<void>(child: RankingEditPage());
      },
      // Home / Rankings / Edit Ranking
      '/${HomePage.routeName}/${RankingListPage.routeName}/${RankingEditPage.routeName}/:id':
          (route) {
        final id = route.pathParameters['id'];
        return MaterialPage<void>(
          fullscreenDialog: true,
          child: RankingEditPage(
            rankingId: id,
          ),
        );
      },
      // Settings
      '/settings': (route) => const MaterialPage<void>(child: SettingsPage()),
    },
  );
});
