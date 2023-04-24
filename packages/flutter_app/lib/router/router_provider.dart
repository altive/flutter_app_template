import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/not_found_page/error_page.dart';
import 'app_routes.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
    errorBuilder: (context, state) => ErrorRoute(
      location: state.location,
      exception: state.error!,
    ).build(context, state),
  );
}
