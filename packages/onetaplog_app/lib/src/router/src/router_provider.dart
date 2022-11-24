import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_routes.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: $appRoutes,
  );
}
