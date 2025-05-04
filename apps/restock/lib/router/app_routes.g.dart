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

          factory: $HomeRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'app-info',
              name: '/appInfo',

              factory: $AppInfoRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/stock-list',
          name: 'stockList',

          factory: $StockListRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/add-item',
          name: 'addItem',

          factory: $AddItemRouteDataExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/menu',
          name: '/menu',

          factory: $MenuRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'theme-selection',
              name: '/theme-selection',

              factory: $ThemeSelectionRouteDataExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'account',
              name: '/account',

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

  String get location => GoRouteData.$location('/home');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppInfoRouteDataExtension on AppInfoRouteData {
  static AppInfoRouteData _fromState(GoRouterState state) =>
      const AppInfoRouteData();

  String get location => GoRouteData.$location('/home/app-info');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StockListRouteDataExtension on StockListRouteData {
  static StockListRouteData _fromState(GoRouterState state) =>
      const StockListRouteData();

  String get location => GoRouteData.$location('/stock-list');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddItemRouteDataExtension on AddItemRouteData {
  static AddItemRouteData _fromState(GoRouterState state) =>
      const AddItemRouteData();

  String get location => GoRouteData.$location('/add-item');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MenuRouteDataExtension on MenuRouteData {
  static MenuRouteData _fromState(GoRouterState state) => const MenuRouteData();

  String get location => GoRouteData.$location('/menu');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThemeSelectionRouteDataExtension on ThemeSelectionRouteData {
  static ThemeSelectionRouteData _fromState(GoRouterState state) =>
      const ThemeSelectionRouteData();

  String get location => GoRouteData.$location('/menu/theme-selection');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteDataExtension on AccountRouteData {
  static AccountRouteData _fromState(GoRouterState state) =>
      const AccountRouteData();

  String get location => GoRouteData.$location('/menu/account');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
