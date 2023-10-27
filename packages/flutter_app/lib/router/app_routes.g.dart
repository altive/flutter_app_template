// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              factory: $HomeRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'app-info',
                  factory: $AppInfoRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'riverpod',
                  factory: $RiverpodExampleRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'provider',
                      factory: $ProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'state-provider',
                      factory: $StateProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'stream-provider',
                      factory: $StreamProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'notifier-provider',
                      factory: $NotifierProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'async-notifier-provider',
                      factory:
                          $AsyncNotifierProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'state-notifier-provider',
                      factory:
                          $StateNotifierProviderRouteDataExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'listen-provider',
                      factory: $ListenProviderRouteDataExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/explore',
              factory: $ExploreRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/post',
              factory: $PostRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/me',
              factory: $MeRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              factory: $SettingsRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'theme-selection',
                  factory: $ThemeSelectionRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'account',
                  factory: $AccountRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppInfoRouteDataExtension on AppInfoRouteData {
  static AppInfoRouteData _fromState(GoRouterState state) =>
      const AppInfoRouteData();

  String get location => GoRouteData.$location(
        '/home/app-info',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RiverpodExampleRouteDataExtension on RiverpodExampleRouteData {
  static RiverpodExampleRouteData _fromState(GoRouterState state) =>
      const RiverpodExampleRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProviderRouteDataExtension on ProviderRouteData {
  static ProviderRouteData _fromState(GoRouterState state) =>
      const ProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StateProviderRouteDataExtension on StateProviderRouteData {
  static StateProviderRouteData _fromState(GoRouterState state) =>
      const StateProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/state-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StreamProviderRouteDataExtension on StreamProviderRouteData {
  static StreamProviderRouteData _fromState(GoRouterState state) =>
      const StreamProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/stream-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $NotifierProviderRouteDataExtension on NotifierProviderRouteData {
  static NotifierProviderRouteData _fromState(GoRouterState state) =>
      const NotifierProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AsyncNotifierProviderRouteDataExtension
    on AsyncNotifierProviderRouteData {
  static AsyncNotifierProviderRouteData _fromState(GoRouterState state) =>
      const AsyncNotifierProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/async-notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StateNotifierProviderRouteDataExtension
    on StateNotifierProviderRouteData {
  static StateNotifierProviderRouteData _fromState(GoRouterState state) =>
      const StateNotifierProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/state-notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ListenProviderRouteDataExtension on ListenProviderRouteData {
  static ListenProviderRouteData _fromState(GoRouterState state) =>
      const ListenProviderRouteData();

  String get location => GoRouteData.$location(
        '/home/riverpod/listen-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExploreRouteDataExtension on ExploreRouteData {
  static ExploreRouteData _fromState(GoRouterState state) =>
      const ExploreRouteData();

  String get location => GoRouteData.$location(
        '/explore',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostRouteDataExtension on PostRouteData {
  static PostRouteData _fromState(GoRouterState state) => const PostRouteData();

  String get location => GoRouteData.$location(
        '/post',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MeRouteDataExtension on MeRouteData {
  static MeRouteData _fromState(GoRouterState state) => const MeRouteData();

  String get location => GoRouteData.$location(
        '/me',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteDataExtension on SettingsRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThemeSelectionRouteDataExtension on ThemeSelectionRouteData {
  static ThemeSelectionRouteData _fromState(GoRouterState state) =>
      const ThemeSelectionRouteData();

  String get location => GoRouteData.$location(
        '/settings/theme-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteDataExtension on AccountRouteData {
  static AccountRouteData _fromState(GoRouterState state) =>
      const AccountRouteData();

  String get location => GoRouteData.$location(
        '/settings/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
