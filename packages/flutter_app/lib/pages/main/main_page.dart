import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/logger.dart';
import '../../util/network_connectivity/network_connectivity.dart';
import '../../util/providers/providers.dart';

/// The page that serves as the main content of the application.
/// It can have multiple Navigation items and switch between internal pages.
class MainPage extends HookConsumerWidget {
  const MainPage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..listen(appLifecycleProvider, (prev, next) {
        logger.finest('AppLifecycleState: prev: $prev, next: $next');
      })
      ..listen(localesProvider, (prev, next) {
        logger.finest('Locales: prev: $prev, next: $next');
      })
      ..listen(networkConnectionStateProvider.future, (previous, next) async {
        final messenger = ScaffoldMessenger.of(context);
        final prevResults = await previous;
        final nextResults = await next;

        // Show SnackBar when network connection is lost and restored.
        if (nextResults case final List<ConnectivityResult> next
            when next.hasNotNetworkConnection) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('Network connection has been lost.'),
            ),
          );
        } else if (prevResults case final List<ConnectivityResult> prev
            when prev.hasNotNetworkConnection) {
          messenger.showSnackBar(
            const SnackBar(
              content: Text('Network connection has been restored'),
            ),
          );
        }
      });

    void onTap(int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }

    return UnfocusOnTap(
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: onTap,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(Icons.search),
              label: 'Explore',
            ),
            NavigationDestination(
              icon: Icon(Icons.post_add_outlined),
              selectedIcon: Icon(Icons.post_add),
              label: 'Post',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'Me',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
        ),
      ),
    );
  }
}
