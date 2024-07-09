import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../initialization_provider.dart';
import '../package_adaptor/tracker_provider.dart';
import '../pages/not_found_page/error_page.dart';
import 'app_routes.dart';
import 'branches/branches.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  final initialization = ref.watch(initializationProvider);
  return GoRouter(
    routes: [
      ...$appRoutes,
    ],
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
    observers: ref.watch(trackerProvider).navigatorObservers(),
  );
}
