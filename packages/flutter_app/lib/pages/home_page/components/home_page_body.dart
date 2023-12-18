import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../gen/strings.g.dart';
import '../../../router/router.dart';
import 'home_list_card.dart';

class HomePageBody extends HookWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        HomeListCard(
          onTap: () => const AppInfoRouteData().go(context),
          label: t.homePage.list.appInfo.label,
        ),
        HomeListCard(
          onTap: () => const RiverpodExampleRouteData().go(context),
          label: 'Riverpod examples',
        ),
      ],
    );
  }
}
