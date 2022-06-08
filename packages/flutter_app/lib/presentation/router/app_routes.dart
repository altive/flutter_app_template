import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/app_info_page/app_info_page.dart';
import '../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/theme_selection_page/theme_selection_page.dart';
import '../pages/top_level_tab/top_level_tab_page.dart';

part 'app_routes.g.dart';

// NOTE:
// サブルートでは使用しないパスパラメータでも、必ずGoRouteDataを継承したクラスでフィールドに定義しないとコード生成に失敗するので注意

@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<TabScafflodRoute>(
  path: '/:tabName',
  routes: [
    TypedGoRoute<AppInfoRoute>(path: 'app-info'),
    TypedGoRoute<ProviderRoute>(path: 'provider'),
    TypedGoRoute<StateProviderRoute>(path: 'state-provider'),
    TypedGoRoute<StateNotifierProviderRoute>(path: 'state-notifier-provider'),
    TypedGoRoute<ListenProviderRoute>(path: 'listen-provider'),
    TypedGoRoute<ThemeSelectionRoute>(path: 'theme-selection'),
  ],
)
class TabScafflodRoute extends GoRouteData {
  const TabScafflodRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => TopLevelTabPage(tabName: tabName);
}

class AppInfoRoute extends GoRouteData {
  const AppInfoRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const AppInfoPage();
}

class ProviderRoute extends GoRouteData {
  const ProviderRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const ProviderPage();
}

class StateProviderRoute extends GoRouteData {
  const StateProviderRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const StateProviderPage();
}

class StateNotifierProviderRoute extends GoRouteData {
  const StateNotifierProviderRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const StateNotifierProviderPage();
}

class ListenProviderRoute extends GoRouteData {
  const ListenProviderRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const ListenProviderPage();
}

class ThemeSelectionRoute extends GoRouteData {
  const ThemeSelectionRoute({required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) => const ThemeSelectionPage();
}
