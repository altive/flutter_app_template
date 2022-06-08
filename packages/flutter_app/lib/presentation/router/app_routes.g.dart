// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
      $tabScafflodRoute,
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

GoRoute get $tabScafflodRoute => GoRouteData.$route(
      path: '/:tabName',
      factory: $TabScafflodRouteExtension._fromState,
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
      ],
    );

extension $TabScafflodRouteExtension on TabScafflodRoute {
  static TabScafflodRoute _fromState(GoRouterState state) => TabScafflodRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AppInfoRouteExtension on AppInfoRoute {
  static AppInfoRoute _fromState(GoRouterState state) => AppInfoRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/app-info',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ProviderRouteExtension on ProviderRoute {
  static ProviderRoute _fromState(GoRouterState state) => ProviderRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $StateProviderRouteExtension on StateProviderRoute {
  static StateProviderRoute _fromState(GoRouterState state) =>
      StateProviderRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/state-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $StateNotifierProviderRouteExtension on StateNotifierProviderRoute {
  static StateNotifierProviderRoute _fromState(GoRouterState state) =>
      StateNotifierProviderRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/state-notifier-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ListenProviderRouteExtension on ListenProviderRoute {
  static ListenProviderRoute _fromState(GoRouterState state) =>
      ListenProviderRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/listen-provider',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $ThemeSelectionRouteExtension on ThemeSelectionRoute {
  static ThemeSelectionRoute _fromState(GoRouterState state) =>
      ThemeSelectionRoute(
        tabName: state.params['tabName']!,
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(tabName)}/theme-selection',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
