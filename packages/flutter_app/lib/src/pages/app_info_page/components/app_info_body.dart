import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../environment/environment.dart';
import '../../../util/localizer/localizer.dart';
import '../../../util/providers/package_info_provider.dart';

class AppInfoBody extends HookConsumerWidget {
  const AppInfoBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final textTheme = Theme.of(context).textTheme;
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(l10n.title),
        Text('Author is ${l10n.authorName}.'),
        const Text('Developed by Ryunosuke Muramatsu.'),
        const Divider(height: 56),
        Center(child: Text('App Info', style: textTheme.displayLarge)),
        const Gap(16),
        Text('Flavor', style: textTheme.displayMedium),
        Text(flavor.name),
        const Gap(32),
        Text('App name', style: textTheme.displaySmall),
        Text(packageInfo.appName),
        const Gap(32),
        Text('Package name', style: textTheme.displaySmall),
        Text(packageInfo.packageName),
        const Divider(height: 56),
      ],
    );
  }
}
