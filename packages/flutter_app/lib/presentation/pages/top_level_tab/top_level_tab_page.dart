import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/hooks/hooks.dart';
import '../../../commons/widgets/unfocus_on_tap.dart';
import 'top_level_tab.dart';
import 'top_level_tab_provider.dart';

class TopLevelTabPage extends HookConsumerWidget {
  const TopLevelTabPage({
    super.key,
    required this.tabName,
  });

  final String tabName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final tabController = ref.watch(topLevelTabProvider.notifier);
    final currentTab = ref.watch(topLevelTabProvider);

    void changeTab(int index) {
      tabController.update((_) => TopLevelTab.values[index]);
      final tab = TopLevelTab.values[index];
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
