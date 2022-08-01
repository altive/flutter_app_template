import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_receiver/notification_receiver.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/unfocus_on_tap.dart';
import '../../core/dynamic_links/dynamic_links.dart';
import '../../models/authenticator/auth_controller.dart';
import 'bottom_tab.dart';
import 'overlay_indicator_state_provider.dart';

final _bottomTabIndexProvider = StateProvider<int>((ref) => 0);

class MainStackView extends HookConsumerWidget {
  const MainStackView();

  static const String routeName = 'main-stack';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    if (user == null) {
      return const SizedBox();
    }
    final dynamicLinks = ref.watch(dynamicLinksControllerProvider);
    useEffect(
      () {
        // 初回表示時のみ実行
        dynamicLinks.navigateDynamicLinksIfNeeded();

        // 通知の権限をリクエストする（iOSではシステムダイアログが表示される）
        ref.read(notificationSettingsProvider.notifier).requestPermission();
        return null;
      },
      const [],
    );

    void switchBottomTab(int index) {
      ref.read(_bottomTabIndexProvider.state).state = index;
    }

    final selectedIndex = ref.watch(_bottomTabIndexProvider);
    return UnfocusOnTap(
      child: LoadingIndicator(
        loading: ref.watch(overlayIndicatorStateProvider.state).state,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: BottomTab.values.map((tab) => tab.page).toList(),
          ),
          bottomNavigationBar: AdaptiveBottomBar(
            items: BottomTab.values
                .map(
                  (tab) => BottomNavigationBarItem(
                    activeIcon: Icon(tab.activeIconData),
                    icon: Icon(tab.deactiveIconData),
                    label: tab.label,
                  ),
                )
                .toList(),
            backgroundColor: Theme.of(context).bottomAppBarColor,
            currentIndex: selectedIndex,
            onTap: switchBottomTab,
          ),
        ),
      ),
    );
  }
}
