import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../commons/hooks/hooks.dart';
import '../../app_info_page/app_info_page.dart';
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
          onTap: () => Routemaster.of(context).push(AppInfoPage.routeName),
          label: l10n.homePageListAppInfoLabel,
        ),
        HomeListCard(
          onTap: () => Routemaster.of(context).push('unavailable-path'),
          label: l10n.homePageListTo404Label,
        ),
      ],
    );
  }
}
