import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_routes.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: $appRoutes,
  ),
);
