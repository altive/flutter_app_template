import 'dart:ui';

import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/localizer/localizer.dart';
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
        extendBody: true,
        body: currentTab.page,
        // Because ThemeData is not reflected in Flutter 3.3.
        // https://github.com/flutter/flutter/issues/110878
        bottomNavigationBar: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: BottomNavigationBar(
              currentIndex: currentTab.index,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 26,
              items: [
                for (final tab in TopLevelTab.values)
                  BottomNavigationBarItem(
                    icon: Icon(tab.inactiveIconData),
                    activeIcon: Icon(tab.activeIconData),
                    label: tab.labelText(L10n.of(context)),
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.3),
                  ),
              ],
              onTap: changeTab,
            ),
          ),
        ),
      ),
    );
  }
}
