import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'app_info_page/app_info_page.dart';
import 'home_page/home_page.dart';

final routemasterProvider = Provider(
  (ref) => RoutemasterDelegate(
    observers: [RouteObserver()],
    routesBuilder: (_) => routes,
  ),
);

final routes = RouteMap(
  routes: {
    '/': (route) => const MaterialPage<void>(child: HomePage()),
    '/app-info': (route) => const MaterialPage<void>(child: AppInfoPage()),
  },
);

class RouteObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page<Object?> page) {
    super.didChangeRoute(routeData, page);
    debugPrint(page.name);
  }
}
