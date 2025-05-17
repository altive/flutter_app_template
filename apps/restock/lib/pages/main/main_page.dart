import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/logger.dart';
import '../../util/network_connectivity/network_connectivity.dart';
import '../../util/providers/providers.dart';
import '../add_item_page/add_item_page.dart';
import '../home_page/home_page.dart';
import '../menu_page/menu_page.dart';
import '../stock_list_page/stock_list_page.dart';
import 'main_tab.dart';
import 'main_tab_provider.dart';
import 'tab_navigator.dart';

/// The page that serves as the main content of the application.
/// It can have multiple Navigation items and switch between internal pages.
class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(mainTabStateProvider);

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
            const SnackBar(content: Text('Network connection has been lost.')),
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

    return UnfocusOnTap(
      child: Scaffold(
        body: IndexedStack(
          index: currentTab.index,
          children:
              MainTab.values
                  .map(
                    (tab) => TabNavigator(
                      navigatorKey: GlobalKey<NavigatorState>(),
                      page: switch (tab) {
                        MainTab.home => const HomePage(),
                        MainTab.stockList => const StockListPage(),
                        MainTab.addItem => const AddItemPage(),
                        MainTab.menu => const MenuPage(),
                      },
                    ),
                  )
                  .toList(),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentTab.index,
          onDestinationSelected: (index) async {
            ref.read(mainTabStateProvider.notifier).setTabFromIndex(index);
            // await Navigator.of(context).pushReplacementNamed(tab.routeName);
          },
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            for (final tab in MainTab.values)
              NavigationDestination(
                icon: Icon(tab.icon),
                selectedIcon: Icon(tab.selectedIcon),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}
