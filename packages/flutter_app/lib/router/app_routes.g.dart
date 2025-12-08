// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainShellRouteData];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
  factory: $MainShellRouteDataExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/home',
          name: '/home',
          factory: $HomeRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'app-info',
              name: '/app-info',
              factory: $AppInfoRouteData._fromState,
            ),
            GoRouteData.$route(
              path: 'riverpod',
              name: '/riverpod',
              factory: $RiverpodExampleRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'provider',
                  name: '/provider',
                  factory: $ProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'state-provider',
                  name: '/state-provider',
                  factory: $StateProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'stream-provider',
                  name: '/stream-provider',
                  factory: $StreamProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'notifier-provider',
                  name: '/notifier-provider',
                  factory: $NotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'async-notifier-provider',
                  name: '/async-notifier-provider',
                  factory: $AsyncNotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'state-notifier-provider',
                  name: '/state-notifier-provider',
                  factory: $StateNotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'listen-provider',
                  name: '/listen-provider',
                  factory: $ListenProviderRouteData._fromState,
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
          name: '/explore',
          factory: $ExploreRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/pub_dev_packages',
          name: '/pub_dev_packages',
          factory: $PubDevPackagesRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          name: '/dashboard',
          factory: $DashboardRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          name: '/settings',
          factory: $SettingsRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'theme-selection',
              name: '/theme-selection',
              factory: $ThemeSelectionRouteData._fromState,
            ),
            GoRouteData.$route(
              path: 'account',
              name: '/account',
              factory: $AccountRouteData._fromState,
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

mixin $HomeRouteData on GoRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AppInfoRouteData on GoRouteData {
  static AppInfoRouteData _fromState(GoRouterState state) =>
      const AppInfoRouteData();

  @override
  String get location => GoRouteData.$location('/home/app-info');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $RiverpodExampleRouteData on GoRouteData {
  static RiverpodExampleRouteData _fromState(GoRouterState state) =>
      const RiverpodExampleRouteData();

  @override
  String get location => GoRouteData.$location('/home/riverpod');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProviderRouteData on GoRouteData {
  static ProviderRouteData _fromState(GoRouterState state) =>
      const ProviderRouteData();

  @override
  String get location => GoRouteData.$location('/home/riverpod/provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $StateProviderRouteData on GoRouteData {
  static StateProviderRouteData _fromState(GoRouterState state) =>
      const StateProviderRouteData();

  @override
  String get location => GoRouteData.$location('/home/riverpod/state-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $StreamProviderRouteData on GoRouteData {
  static StreamProviderRouteData _fromState(GoRouterState state) =>
      const StreamProviderRouteData();

  @override
  String get location =>
      GoRouteData.$location('/home/riverpod/stream-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NotifierProviderRouteData on GoRouteData {
  static NotifierProviderRouteData _fromState(GoRouterState state) =>
      const NotifierProviderRouteData();

  @override
  String get location =>
      GoRouteData.$location('/home/riverpod/notifier-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AsyncNotifierProviderRouteData on GoRouteData {
  static AsyncNotifierProviderRouteData _fromState(GoRouterState state) =>
      const AsyncNotifierProviderRouteData();

  @override
  String get location =>
      GoRouteData.$location('/home/riverpod/async-notifier-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $StateNotifierProviderRouteData on GoRouteData {
  static StateNotifierProviderRouteData _fromState(GoRouterState state) =>
      const StateNotifierProviderRouteData();

  @override
  String get location =>
      GoRouteData.$location('/home/riverpod/state-notifier-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ListenProviderRouteData on GoRouteData {
  static ListenProviderRouteData _fromState(GoRouterState state) =>
      const ListenProviderRouteData();

  @override
  String get location =>
      GoRouteData.$location('/home/riverpod/listen-provider');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ExploreRouteData on GoRouteData {
  static ExploreRouteData _fromState(GoRouterState state) =>
      const ExploreRouteData();

  @override
  String get location => GoRouteData.$location('/explore');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PubDevPackagesRouteData on GoRouteData {
  static PubDevPackagesRouteData _fromState(GoRouterState state) =>
      const PubDevPackagesRouteData();

  @override
  String get location => GoRouteData.$location('/pub_dev_packages');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DashboardRouteData on GoRouteData {
  static DashboardRouteData _fromState(GoRouterState state) =>
      const DashboardRouteData();

  @override
  String get location => GoRouteData.$location('/dashboard');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $SettingsRouteData on GoRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ThemeSelectionRouteData on GoRouteData {
  static ThemeSelectionRouteData _fromState(GoRouterState state) =>
      const ThemeSelectionRouteData();

  @override
  String get location => GoRouteData.$location('/settings/theme-selection');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $AccountRouteData on GoRouteData {
  static AccountRouteData _fromState(GoRouterState state) =>
      const AccountRouteData();

  @override
  String get location => GoRouteData.$location('/settings/account');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
