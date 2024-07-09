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

  static const String name = '/home';
  static const String path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class AppInfoRouteData extends GoRouteData {
  const AppInfoRouteData();

  static const String name = '/app-info';
  static const String path = 'app-info';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppInfoPage();
  }
}

class RiverpodExampleRouteData extends GoRouteData {
  const RiverpodExampleRouteData();

  static const String name = '/riverpod';
  static const String path = 'riverpod';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RiverpodExamplePage();
  }
}

class ProviderRouteData extends GoRouteData {
  const ProviderRouteData();

  static const String name = '/provider';
  static const String path = 'provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProviderPage();
}

class StateProviderRouteData extends GoRouteData {
  const StateProviderRouteData();

  static const String name = '/state-provider';
  static const String path = 'state-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateProviderPage();
}

class StreamProviderRouteData extends GoRouteData {
  const StreamProviderRouteData();

  static const String name = '/stream-provider';
  static const String path = 'stream-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StreamProviderPage();
}

class NotifierProviderRouteData extends GoRouteData {
  const NotifierProviderRouteData();

  static const String name = '/notifier-provider';
  static const String path = 'notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NotifierProviderPage();
}

class AsyncNotifierProviderRouteData extends GoRouteData {
  const AsyncNotifierProviderRouteData();

  static const String name = '/async-notifier-provider';
  static const String path = 'async-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AsyncNotifierProviderPage();
}

class StateNotifierProviderRouteData extends GoRouteData {
  const StateNotifierProviderRouteData();

  static const String name = '/state-notifier-provider';
  static const String path = 'state-notifier-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const StateNotifierProviderPage();
}

class ListenProviderRouteData extends GoRouteData {
  const ListenProviderRouteData();

  static const String name = '/listen-provider';
  static const String path = 'listen-provider';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ListenProviderPage();
}
