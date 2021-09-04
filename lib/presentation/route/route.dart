import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../app_info_page/app_info_page.dart';
import '../home_page/home_page.dart';
import '../not_found_page/not_found_page.dart';
import '../ranking_detail_page/ranking_detail_page.dart';
import '../ranking_edit_page/ranking_edit_page.dart';
import '../ranking_list_page/ranking_list_page.dart';
import '../settings_page/settings_page.dart';
import '../tab_scaffold_page/tab_scaffold_page.dart';
import 'general_route_observer.dart';

final routemasterProvider = Provider(
  (ref) => RoutemasterDelegate(
    observers: [GeneralRouteObserver()],
    routesBuilder: (_) => routes,
  ),
);

final routes = RouteMap(
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
