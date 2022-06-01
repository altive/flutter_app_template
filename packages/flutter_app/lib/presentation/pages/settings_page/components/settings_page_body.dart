import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../../../commons/hooks/hooks.dart';
import '../../theme_selection_page/theme_selection_page.dart';

class SettingsPageBody extends HookConsumerWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            onTap: () =>
                Routemaster.of(context).push(ThemeSelectionPage.routeName),
            title: Text(l10n.homePageListThemeSelectorLabel),
          ),
        ),
      ],
    );
  }
}
