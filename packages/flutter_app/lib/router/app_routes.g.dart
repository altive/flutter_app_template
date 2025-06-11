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

          factory: _$HomeRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'app-info',
              name: '/app-info',

              factory: _$AppInfoRouteData._fromState,
            ),
            GoRouteData.$route(
              path: 'riverpod',
              name: '/riverpod',

              factory: _$RiverpodExampleRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'provider',
                  name: '/provider',

                  factory: _$ProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'state-provider',
                  name: '/state-provider',

                  factory: _$StateProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'stream-provider',
                  name: '/stream-provider',

                  factory: _$StreamProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'notifier-provider',
                  name: '/notifier-provider',

                  factory: _$NotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'async-notifier-provider',
                  name: '/async-notifier-provider',

                  factory: _$AsyncNotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'state-notifier-provider',
                  name: '/state-notifier-provider',

                  factory: _$StateNotifierProviderRouteData._fromState,
                ),
                GoRouteData.$route(
                  path: 'listen-provider',
                  name: '/listen-provider',

                  factory: _$ListenProviderRouteData._fromState,
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

          factory: _$ExploreRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/pub_dev_packages',
          name: '/pub_dev_packages',

          factory: _$PubDevPackagesRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          name: '/dashboard',

          factory: _$DashboardRouteData._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/settings',
          name: '/settings',

          factory: _$SettingsRouteData._fromState,
          routes: [
            GoRouteData.$route(
              path: 'theme-selection',
              name: '/theme-selection',

              factory: _$ThemeSelectionRouteData._fromState,
            ),
            GoRouteData.$route(
              path: 'account',
              name: '/account',

              factory: _$AccountRouteData._fromState,
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

mixin _$HomeRouteData on GoRouteData {
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

mixin _$AppInfoRouteData on GoRouteData {
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

mixin _$RiverpodExampleRouteData on GoRouteData {
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

mixin _$ProviderRouteData on GoRouteData {
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

mixin _$StateProviderRouteData on GoRouteData {
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

mixin _$StreamProviderRouteData on GoRouteData {
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

mixin _$NotifierProviderRouteData on GoRouteData {
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

mixin _$AsyncNotifierProviderRouteData on GoRouteData {
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

mixin _$StateNotifierProviderRouteData on GoRouteData {
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

mixin _$ListenProviderRouteData on GoRouteData {
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

mixin _$ExploreRouteData on GoRouteData {
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

mixin _$PubDevPackagesRouteData on GoRouteData {
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

mixin _$DashboardRouteData on GoRouteData {
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

mixin _$SettingsRouteData on GoRouteData {
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

mixin _$ThemeSelectionRouteData on GoRouteData {
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

mixin _$AccountRouteData on GoRouteData {
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
