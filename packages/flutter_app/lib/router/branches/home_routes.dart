import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/app_info_page/app_info_page.dart';
import '../../pages/home_page/home_page.dart';
import '../../pages/riverpod_example_page/async_notifier_provider_page/async_notifier_provider_page.dart';
import '../../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../../pages/riverpod_example_page/notifier_provider_page/notifier_provider_page.dart';
import '../../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../../pages/riverpod_example_page/riverpod_example_page.dart';
import '../../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../../pages/riverpod_example_page/stream_provider_page.dart/stream_provider_page.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  static const name = '/home';
  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData {
  const AppInfoRouteData();

  static const name = '/app-info';
  static const path = 'app-info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}

class RiverpodExampleRouteData extends GoRouteData {
  const RiverpodExampleRouteData();

  static const name = '/riverpod';
  static const path = 'riverpod';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodExamplePage();
  }
}

class ProviderRouteData extends GoRouteData {
  const ProviderRouteData();

  static const name = '/provider';
  static const path = 'provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProviderPage();
}

class StateProviderRouteData extends GoRouteData {
  const StateProviderRouteData();

  static const name = '/state-provider';
  static const path = 'state-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateProviderPage();
}

class StreamProviderRouteData extends GoRouteData {
  const StreamProviderRouteData();

  static const name = '/stream-provider';
  static const path = 'stream-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StreamProviderPage();
}

class NotifierProviderRouteData extends GoRouteData {
  const NotifierProviderRouteData();

  static const name = '/notifier-provider';
  static const path = 'notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotifierProviderPage();
}

class AsyncNotifierProviderRouteData extends GoRouteData {
  const AsyncNotifierProviderRouteData();

  static const name = '/async-notifier-provider';
  static const path = 'async-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AsyncNotifierProviderPage();
}

class StateNotifierProviderRouteData extends GoRouteData {
  const StateNotifierProviderRouteData();

  static const name = '/state-notifier-provider';
  static const path = 'state-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateNotifierProviderPage();
}

class ListenProviderRouteData extends GoRouteData {
  const ListenProviderRouteData();

  static const name = '/listen-provider';
  static const path = 'listen-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListenProviderPage();
}
