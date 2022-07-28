import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/widgets/unfocus_on_tap.dart';
import '../../../util/localizer/localizer.dart';
import 'top_level_tab.dart';
import 'top_level_tab_provider.dart';

class TopLevelTabPage extends HookConsumerWidget {
  const TopLevelTabPage({
    super.key,
    required this.tab,
  });

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final tabController = ref.watch(topLevelTabProvider.notifier);
    final currentTab = ref.watch(topLevelTabProvider);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          tabController.update((_) => TopLevelTab.values.byName(tab.name));
        });
        return null;
      },
      [tab],
    );

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
