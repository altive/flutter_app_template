import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/localizer/localizer.dart';
import 'top_level_tab.dart';
import 'top_level_tab_state_provider.dart';

class TopLevelTabPage extends HookConsumerWidget {
  const TopLevelTabPage({
    super.key,
    required this.tab,
  });

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final tabController = ref.watch(topLevelTabStateProvider.notifier);
    final currentTab = ref.watch(topLevelTabStateProvider);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          tabController.changeTab(tab);
        });
        return null;
      },
      [tab],
    );

    void changeTab(int index) {
      tabController.changeTabWithIndex(index);
      context.go('/${tab.name}');
    }

    return UnfocusOnTap(
      child: Scaffold(
        body: currentTab.page,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab.index,
          items: [
            for (final tab in TopLevelTab.values)
              BottomNavigationBarItem(
                icon: Icon(tab.iconData),
                label: tab.labelText(l10n),
              ),
          ],
          onTap: changeTab,
        ),
      ),
    );
  }
}
