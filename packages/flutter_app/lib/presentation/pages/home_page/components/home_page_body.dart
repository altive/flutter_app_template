import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../commons/hooks/hooks.dart';
import '../../../router/router.dart';
import '../../top_level_tab/top_level_tab.dart';
import 'home_list_card.dart';

class HomePageBody extends HookWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HomeListCard(
          onTap: () => AppInfoRoute(tabName: TopLevelTab.home.name).go(context),
          label: l10n.homePageListAppInfoLabel,
        ),
      ],
    );
  }
}
