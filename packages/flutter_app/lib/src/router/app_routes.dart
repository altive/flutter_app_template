import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/account/account_page.dart';
import '../pages/app_info_page/app_info_page.dart';
import '../pages/riverpod_example_page/listen_provider_page/listen_provider_page.dart';
import '../pages/riverpod_example_page/provider_page/provider_page.dart';
import '../pages/riverpod_example_page/state_notifier_provider_page/state_notifier_provider_page.dart';
import '../pages/riverpod_example_page/state_provider_page/state_provider_page.dart';
import '../pages/signin/signin_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/theme_selection_page/theme_selection_page.dart';
import '../pages/top_level_tab/top_level_tab.dart';
import '../pages/top_level_tab/top_level_tab_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<SigninRoute>(
  path: '/signin',
)
class SigninRoute extends GoRouteData {
  const SigninRoute();

  @override
  Widget build(BuildContext context) => const SigninPage();
}

@TypedGoRoute<TopLevelTabRoute>(
  path: '/:tab',
  routes: [
    TypedGoRoute<AppInfoRoute>(path: 'app-info'),
    TypedGoRoute<ProviderRoute>(path: 'provider'),
    TypedGoRoute<StateProviderRoute>(path: 'state-provider'),
    TypedGoRoute<StateNotifierProviderRoute>(path: 'state-notifier-provider'),
    TypedGoRoute<ListenProviderRoute>(path: 'listen-provider'),
    TypedGoRoute<ThemeSelectionRoute>(path: 'theme-selection'),
    TypedGoRoute<AccountRoute>(path: 'account'),
  ],
)
class TopLevelTabRoute extends GoRouteData {
  const TopLevelTabRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => TopLevelTabPage(tab: tab);
}

class AppInfoRoute extends GoRouteData {
  const AppInfoRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const AppInfoPage();
}

class ProviderRoute extends GoRouteData {
  const ProviderRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const ProviderPage();
}

class StateProviderRoute extends GoRouteData {
  const StateProviderRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const StateProviderPage();
}

class StateNotifierProviderRoute extends GoRouteData {
  const StateNotifierProviderRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const StateNotifierProviderPage();
}

class ListenProviderRoute extends GoRouteData {
  const ListenProviderRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const ListenProviderPage();
}

class ThemeSelectionRoute extends GoRouteData {
  const ThemeSelectionRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const ThemeSelectionPage();
}

class AccountRoute extends GoRouteData {
  const AccountRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const AccountPage();
}
