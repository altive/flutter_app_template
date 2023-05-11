// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $signinRoute,
      $topLevelTabRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $signinRoute => GoRouteData.$route(
      path: '/signin',
      factory: $SigninRouteExtension._fromState,
    );

extension $SigninRouteExtension on SigninRoute {
  static SigninRoute _fromState(GoRouterState state) => const SigninRoute();

  String get location => GoRouteData.$location(
        '/signin',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $topLevelTabRoute => GoRouteData.$route(
      path: '/:tab',
      factory: $TopLevelTabRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'app-info',
          factory: $AppInfoRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'provider',
          factory: $ProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'state-provider',
          factory: $StateProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'stream-provider',
          factory: $StreamProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'notifier-provider',
          factory: $NotifierProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'async-notifier-provider',
          factory: $AsyncNotifierProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'state-notifier-provider',
          factory: $StateNotifierProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'listen-provider',
          factory: $ListenProviderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'theme-selection',
          factory: $ThemeSelectionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'account',
          factory: $AccountRouteExtension._fromState,
        ),
      ],
    );

extension $TopLevelTabRouteExtension on TopLevelTabRoute {
  static TopLevelTabRoute _fromState(GoRouterState state) => TopLevelTabRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AppInfoRouteExtension on AppInfoRoute {
  static AppInfoRoute _fromState(GoRouterState state) => AppInfoRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/app-info',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ProviderRouteExtension on ProviderRoute {
  static ProviderRoute _fromState(GoRouterState state) => ProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StateProviderRouteExtension on StateProviderRoute {
  static StateProviderRoute _fromState(GoRouterState state) =>
      StateProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/state-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StreamProviderRouteExtension on StreamProviderRoute {
  static StreamProviderRoute _fromState(GoRouterState state) =>
      StreamProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/stream-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NotifierProviderRouteExtension on NotifierProviderRoute {
  static NotifierProviderRoute _fromState(GoRouterState state) =>
      NotifierProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AsyncNotifierProviderRouteExtension on AsyncNotifierProviderRoute {
  static AsyncNotifierProviderRoute _fromState(GoRouterState state) =>
      AsyncNotifierProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/async-notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $StateNotifierProviderRouteExtension on StateNotifierProviderRoute {
  static StateNotifierProviderRoute _fromState(GoRouterState state) =>
      StateNotifierProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/state-notifier-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ListenProviderRouteExtension on ListenProviderRoute {
  static ListenProviderRoute _fromState(GoRouterState state) =>
      ListenProviderRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/listen-provider',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ThemeSelectionRouteExtension on ThemeSelectionRoute {
  static ThemeSelectionRoute _fromState(GoRouterState state) =>
      ThemeSelectionRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/theme-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.pathParameters['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

const _$TopLevelTabEnumMap = {
  TopLevelTab.home: 'home',
  TopLevelTab.riverpod: 'riverpod',
  TopLevelTab.settings: 'settings',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
