import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../router/router.dart';
import '../../../util/localizer/localizer.dart';
import 'home_list_card.dart';

class HomePageBody extends HookWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HomeListCard(
          onTap: () => const AppInfoRouteData().go(context),
          label: l10n.homePageListAppInfoLabel,
        ),
        HomeListCard(
          onTap: () => const RiverpodExampleRouteData().go(context),
          label: 'Riverpod examples',
        ),
      ],
    );
  }
}
