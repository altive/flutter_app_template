import 'package:flutter/cupertino.dart';
import 'package:routemaster/routemaster.dart';

import '../../commons/widgets/unfocus_on_tap.dart';
import 'top_level_tab.dart';

class TabScaffoldPage extends StatelessWidget {
  const TabScaffoldPage({Key? key}) : super(key: key);

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
