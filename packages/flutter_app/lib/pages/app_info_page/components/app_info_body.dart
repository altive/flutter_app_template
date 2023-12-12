import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../environment/environment.dart';
import '../../../gen/strings.g.dart';
import '../../../util/providers/package_info_provider.dart';
import '../../../widgets/widgets.dart';

class AppInfoBody extends HookConsumerWidget {
  const AppInfoBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = Translations.of(context);
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return ListView(
      children: <Widget>[
        Text(i18n.title),
        const Gap(8),
        Text('Author is ${i18n.author.name}.'),
        const Gap(8),
        const Text('Developed by Ryunosuke Muramatsu.'),
        const Divider(),
        const Center(child: DisplayMediumText('App Environment')),
        const Gap(16),
        const TitleLargeText('Flavor'),
        Text(flavor.name),
        const Gap(32),
        const TitleLargeText('App name'),
        Text(packageInfo.appName),
        const Gap(32),
        const TitleLargeText('Package name'),
        Text(packageInfo.packageName),
      ],
    );
  }
}
