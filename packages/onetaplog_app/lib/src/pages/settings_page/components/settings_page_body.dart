import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'settings_card.dart';

class SettingsPageBody extends ConsumerWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      sliver: SliverList(
        delegate: SliverChildListDelegate.fixed(
          [
            SettingsCard(),
            Gap(8),
            SettingsCard(),
            Gap(8),
            SettingsCard(),
          ],
        ),
      ),
    );
  }
}
