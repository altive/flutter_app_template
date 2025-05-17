import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    super.key,
    required this.navigatorKey,
    required this.page,
    this.root = '/',
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget page;
  final String root;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {root: (context) => page};
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute<void>(
          builder: routeBuilders[routeSettings.name]!,
          settings: routeSettings,
        );
      },
    );
  }
}
