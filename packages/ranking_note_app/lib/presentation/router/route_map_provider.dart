import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../account_page/account_page.dart';
import '../my_ranking_detail_page/my_ranking_detail_page.dart';
import '../my_ranking_list_page/my_ranking_list_page.dart';
import '../not_found_page/not_found_page.dart';
import '../public_ranking_detail_page/public_ranking_detail_page.dart';
import '../public_ranking_list_page/public_ranking_list_page.dart';
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
            paths: [
              '/${MyRankingListPage.routeName}',
              '/${PublicRankingListPage.routeName}',
              '/${SettingsPage.routeName}',
            ],
          ),
      // Home (My Ranking list)
      '/${MyRankingListPage.routeName}': (route) =>
          const MaterialPage<void>(child: MyRankingListPage()),
      // Home / My Ranking detail
      '/${MyRankingListPage.routeName}/${MyRankingDetailPage.routeName}/:id':
          (route) {
        final id = route.pathParameters['id'];
        if (id == null) {
          return const NotFound();
        }
        return MaterialPage<void>(
          child: MyRankingDetailPage(rankingId: id),
        );
      },
      // Search (Public Ranking list)
      '/${PublicRankingListPage.routeName}': (route) =>
          const MaterialPage<void>(child: PublicRankingListPage()),
      // Search / Public Ranking detail
      '/${PublicRankingListPage.routeName}/${PublicRankingDetailPage.routeName}/:id':
          (route) {
        final id = route.pathParameters['id'];
        if (id == null) {
          return const NotFound();
        }
        return MaterialPage<void>(
          child: PublicRankingDetailPage(rankingId: id),
        );
      },
      // Home / My Ranking detail / Public Ranking detail
      '/${MyRankingListPage.routeName}/${MyRankingDetailPage.routeName}/:id/${PublicRankingDetailPage.routeNameByPreview}':
          (route) {
        final id = route.pathParameters['id'];
        if (id == null) {
          return const NotFound();
        }
        return MaterialPage<void>(
          fullscreenDialog: true,
          child: PublicRankingDetailPage(rankingId: id),
        );
      },
      // Settings
      '/${SettingsPage.routeName}': (route) =>
          const MaterialPage<void>(child: SettingsPage()),
      // Account
      '/${SettingsPage.routeName}/${AccountPage.routeName}': (route) =>
          const MaterialPage<void>(child: AccountPage()),
      // Theme selection
      '/${SettingsPage.routeName}/${ThemeSelectionPage.routeName}': (route) =>
          const MaterialPage<void>(child: ThemeSelectionPage()),
    },
  );
});
