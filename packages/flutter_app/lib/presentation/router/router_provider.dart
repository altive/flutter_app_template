import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/not_found_page/error_page.dart';
import 'app_routes.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    routes: $appRoutes,
    errorBuilder: (context, state) => ErrorRoute(
      location: state.location,
      exception: state.error!,
    ).build(context),
    navigatorBuilder: (context, state, child) {
      if (kReleaseMode) {
        return const SizedBox();
      } else {
        return Material(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(child: child),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Route location: ${state.location}'),
                ),
              ],
            ),
          ),
        );
      }
    },
  ),
);
