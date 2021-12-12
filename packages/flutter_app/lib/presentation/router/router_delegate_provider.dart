import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'general_route_observer.dart';
import 'route_map_provider.dart';

final routerDelegateProvider = Provider(
  (ref) => RoutemasterDelegate(
    observers: [GeneralRouteObserver()],
    routesBuilder: (_) => ref.watch(routeMapProvider),
  ),
);
