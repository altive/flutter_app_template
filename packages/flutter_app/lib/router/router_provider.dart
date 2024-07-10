import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../initialization_provider.dart';
import '../package_adaptor/tracker_provider.dart';
import '../pages/not_found_page/error_page.dart';
import '../util/logger.dart';
import 'app_routes.dart';
import 'branches/branches.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  final initialization = ref.watch(initializationProvider);
  final tracker = ref.watch(trackerProvider);

  late final GoRouter router;
  router = GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (initialization.isLoading || initialization.hasError) {
        return InitializationRoute.path;
      }
      if (state.matchedLocation == '/') {
        return HomeRouteData.path;
      }
      return null;
    },
    errorBuilder: (context, state) => ErrorRoute(
      location: state.uri.path,
      exception: state.error!,
    ).build(context, state),
    observers: [
      ...tracker.navigatorObservers(
        nameExtractor: (settings) {
          final config = router.routerDelegate.currentConfiguration;
          final name = '${config.uri.path}/${settings.name}';
          logger.finest('navigated route name: $name');
          return name;
        },
        routeFilter: (route) {
          // Only monitor transitions in Navigator.
          // Transitions in GoRouter can be detected by routerDelegate and
          // are therefore not monitored here.
          return route is MaterialPageRoute;
        },
      ),
    ],
  );

  Future<void> handleRouteChanged() async {
    final config = router.routerDelegate.currentConfiguration;
    final path = config.uri.path;
    // 画面遷移時に画面遷移イベントを送信する。
    unawaited(tracker.trackScreenView(path));
    logger.finest('tracked screen path: $path');
  }

  router.routerDelegate.addListener(handleRouteChanged);
  ref.onDispose(() async {
    router.routerDelegate.removeListener(handleRouteChanged);
  });
  return router;
}
