import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/not_found_page/error_page.dart';
import 'app_routes.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.matchedLocation == '/') {
        return HomeShellBranchData.path;
      }
      return null;
    },
    errorBuilder: (context, state) => ErrorRoute(
      location: state.uri.path,
      exception: state.error!,
    ).build(context, state),
  );
}
