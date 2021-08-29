import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'app_info_page/app_info_page.dart';
import 'home_page/home_page.dart';
import 'not_found_page/not_found_page.dart';
import 'settings_page/settings_page.dart';
import 'tab_scaffold_page/tab_scaffold_page.dart';

final routemasterProvider = Provider(
  (ref) => RoutemasterDelegate(
    observers: [RouteObserver()],
    routesBuilder: (_) => routes,
  ),
);

final routes = RouteMap(
  onUnknownRoute: (path) {
    return MaterialPage<void>(child: NotFoundPage(path));
  },
  routes: {
    '/': (route) => const CupertinoTabPage(
          child: TabScaffoldPage(),
          paths: ['/home', '/settings'],
        ),
    '/home': (route) => const MaterialPage<void>(child: HomePage()),
    '/home/app-info': (route) => const MaterialPage<void>(child: AppInfoPage()),
    '/settings': (route) => const MaterialPage<void>(child: SettingsPage()),
  },
);

class RouteObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page<Object?> page) {
    super.didChangeRoute(routeData, page);
    debugPrint(page.name);
  }
}
