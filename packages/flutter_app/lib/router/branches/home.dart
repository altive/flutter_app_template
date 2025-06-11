part of '../app_routes.dart';

// Shell Branch Data Classes
class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

// Route Data Classes with Mixins
class HomeRouteData extends GoRouteData with _$HomeRouteData {
  const HomeRouteData();

  static const name = '/home';
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData with _$AppInfoRouteData {
  const AppInfoRouteData();

  static const name = '/app-info';
  static const path = 'app-info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}

class RiverpodExampleRouteData extends GoRouteData
    with _$RiverpodExampleRouteData {
  const RiverpodExampleRouteData();

  static const name = '/riverpod';
  static const path = 'riverpod';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodExamplePage();
  }
}

class ProviderRouteData extends GoRouteData with _$ProviderRouteData {
  const ProviderRouteData();

  static const name = '/provider';
  static const path = 'provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProviderPage();
}

class StateProviderRouteData extends GoRouteData with _$StateProviderRouteData {
  const StateProviderRouteData();

  static const name = '/state-provider';
  static const path = 'state-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateProviderPage();
}

class StreamProviderRouteData extends GoRouteData
    with _$StreamProviderRouteData {
  const StreamProviderRouteData();

  static const name = '/stream-provider';
  static const path = 'stream-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StreamProviderPage();
}

class NotifierProviderRouteData extends GoRouteData
    with _$NotifierProviderRouteData {
  const NotifierProviderRouteData();

  static const name = '/notifier-provider';
  static const path = 'notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotifierProviderPage();
}

class AsyncNotifierProviderRouteData extends GoRouteData
    with _$AsyncNotifierProviderRouteData {
  const AsyncNotifierProviderRouteData();

  static const name = '/async-notifier-provider';
  static const path = 'async-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AsyncNotifierProviderPage();
}

class StateNotifierProviderRouteData extends GoRouteData
    with _$StateNotifierProviderRouteData {
  const StateNotifierProviderRouteData();

  static const name = '/state-notifier-provider';
  static const path = 'state-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateNotifierProviderPage();
}

class ListenProviderRouteData extends GoRouteData
    with _$ListenProviderRouteData {
  const ListenProviderRouteData();

  static const name = '/listen-provider';
  static const path = 'listen-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListenProviderPage();
}
