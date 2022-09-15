import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages/histories_page/histories_page.dart';
import '../../pages/onetap_page/onetap_page.dart';
import '../../pages/settings_page/settings_page.dart';
import '../../pages/splash_page/splash_page.dart';
import '../../pages/top_level_tab_page/top_level_tab.dart';
import '../../pages/top_level_tab_page/top_level_tab_page.dart';
import 'fade_transition_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context) => const SplashPage();
}

// @TypedGoRoute<SigninRoute>(
//   path: '/signin',
// )
// class SigninRoute extends GoRouteData {
//   const SigninRoute();

//   @override
//   Widget build(BuildContext context) => const SigninPage();
// }

@TypedGoRoute<TopLevelTabRoute>(
  path: '/:tab',
  routes: [
    TypedGoRoute<OnetapRoute>(path: 'onetap'),
    TypedGoRoute<HistoriesRoute>(path: 'histories'),
    TypedGoRoute<SettingsRoute>(path: 'settings'),
  ],
)
class TopLevelTabRoute extends GoRouteData {
  const TopLevelTabRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => TopLevelTabPage(tab: tab);
  @override
  Page<void> buildPageWithState(BuildContext context, GoRouterState state) {
    return fadeTransitionPage(child: TopLevelTabPage(tab: tab));
  }
}

class OnetapRoute extends GoRouteData {
  const OnetapRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const OnetapPage();
}

class HistoriesRoute extends GoRouteData {
  const HistoriesRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const HistoriesPage();
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) => const SettingsPage();
}
