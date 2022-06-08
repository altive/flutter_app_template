// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
      $signinRoute,
      $topLevelTabRoute,
    ];

GoRoute get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $signinRoute => GoRouteData.$route(
      path: '/signin',
      factory: $SigninRouteExtension._fromState,
    );

extension $SigninRouteExtension on SigninRoute {
  static SigninRoute _fromState(GoRouterState state) => const SigninRoute();

  String get location => GoRouteData.$location(
        '/signin',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $topLevelTabRoute => GoRouteData.$route(
      path: '/:tabid',
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
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AppInfoRouteExtension on AppInfoRoute {
  static AppInfoRoute _fromState(GoRouterState state) => AppInfoRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/app-info',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ProviderRouteExtension on ProviderRoute {
  static ProviderRoute _fromState(GoRouterState state) => ProviderRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $StateProviderRouteExtension on StateProviderRoute {
  static StateProviderRoute _fromState(GoRouterState state) =>
      StateProviderRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/state-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $StateNotifierProviderRouteExtension on StateNotifierProviderRoute {
  static StateNotifierProviderRoute _fromState(GoRouterState state) =>
      StateNotifierProviderRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/state-notifier-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ListenProviderRouteExtension on ListenProviderRoute {
  static ListenProviderRoute _fromState(GoRouterState state) =>
      ListenProviderRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/listen-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ThemeSelectionRouteExtension on ThemeSelectionRoute {
  static ThemeSelectionRoute _fromState(GoRouterState state) =>
      ThemeSelectionRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/theme-selection',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute(
        tabid: state.params['tabid']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabid)}/account',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
