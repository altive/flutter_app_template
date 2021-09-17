import 'package:flutter/material.dart';

import 'package:routemaster/routemaster.dart';

class GeneralRouteObserver extends RoutemasterObserver {
  @override
  void didChangeRoute(RouteData routeData, Page<Object?> page) {
    super.didChangeRoute(routeData, page);
    debugPrint(page.name);
  }

  @override
  void didPop(Route<Object?> route, Route<Object?>? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint(previousRoute?.settings.name);
  }

  @override
  void didPush(Route<Object?> route, Route<Object?>? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint(previousRoute?.settings.name);
  }

  @override
  void didReplace({Route<Object?>? newRoute, Route<Object?>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint('${newRoute?.settings.name} to ${oldRoute?.settings.name}');
  }
}
