import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routemaster/routemaster.dart';

import '../../../commons/hooks/hooks.dart';
import '../../../commons/widgets/unfocus_on_tap.dart';
import 'top_level_tab.dart';

class TabScaffoldPage extends HookWidget {
  const TabScaffoldPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
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
                label: tab.labelText(l10n),
              ),
          ],
        ),
      ),
    );
  }
}
