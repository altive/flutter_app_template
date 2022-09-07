import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

import 'top_level_tab.dart';

class TabScaffoldPage extends StatelessWidget {
  const TabScaffoldPage();

  @override
  Widget build(BuildContext context) {
    final tabState = CupertinoTabPage.of(context);
    return UnfocusOnTap(
      child: CupertinoTabScaffold(
        controller: tabState.controller,
        tabBuilder: tabState.tabBuilder,
        tabBar: CupertinoTabBar(
          items: [
            for (final tab in TopLevelTab.values)
              BottomNavigationBarItem(
                icon: Icon(tab.iconData),
                label: tab.label,
              ),
          ],
        ),
      ),
    );
  }
}
