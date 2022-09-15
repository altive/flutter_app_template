// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
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

GoRoute get $topLevelTabRoute => GoRouteData.$route(
      path: '/:tab',
      factory: $TopLevelTabRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'onetap',
          factory: $OnetapRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'histories',
          factory: $HistoriesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings',
          factory: $SettingsRouteExtension._fromState,
        ),
      ],
    );

extension $TopLevelTabRouteExtension on TopLevelTabRoute {
  static TopLevelTabRoute _fromState(GoRouterState state) => TopLevelTabRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $OnetapRouteExtension on OnetapRoute {
  static OnetapRoute _fromState(GoRouterState state) => OnetapRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/onetap',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $HistoriesRouteExtension on HistoriesRoute {
  static HistoriesRoute _fromState(GoRouterState state) => HistoriesRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/histories',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => SettingsRoute(
        tab: _$TopLevelTabEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TopLevelTabEnumMap[tab]!)}/settings',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

const _$TopLevelTabEnumMap = {
  TopLevelTab.onetap: 'onetap',
  TopLevelTab.histories: 'histories',
  TopLevelTab.settings: 'settings',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
