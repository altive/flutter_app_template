import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../initialization_provider.dart';
import '../package_adaptor/tracker_provider.dart';
import '../pages/not_found_page/error_page.dart';
import '../util/logger.dart';
import 'app_routes.dart';
import 'branches/branches.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(Ref ref) {
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
    // As StatefulShellRoute does not support screen tracking
    // by NavigatorObserver, screen tracking logs are sent here.
    // If StatefulShellRoute supports NavigatorObserver, it will no longer be
    // necessary and the routeFilter for NavigatorObserver will be unnecessary.
    final paths = router.routerDelegate.currentConfiguration.uri.pathSegments;
    if (paths.lastOrNull case final String lastPath) {
      unawaited(tracker.trackScreenView('/$lastPath'));
      logger.finest('tracked screen path: /$lastPath');
    }
  }

  router.routerDelegate.addListener(handleRouteChanged);
  ref.onDispose(() async {
    router.routerDelegate.removeListener(handleRouteChanged);
  });
  return router;
}
