import 'package:altive_flutter_kit/altive_flutter_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../commons/hooks/use_localization.dart';
import '../../commons/providers/flavor_provider.dart';
import '../../commons/providers/package_info_provider.dart';

class AppInfoPage extends HookConsumerWidget {
  const AppInfoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final textTheme = Theme.of(context).textTheme;
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(l10n.title),
              Text('Author is ${l10n.authorName}.'),
              const Text('Developed by Ryunosuke Muramatsu.'),
              const Divider(height: 56),
              Center(child: Text('App Info', style: textTheme.headline2)),
              const Gap(16),
              Text('Flavor', style: textTheme.headline3),
              Text(flavor.name),
              const Gap(32),
              Text('App name', style: textTheme.headline4),
              Text(packageInfo.appName),
              const Gap(32),
              Text('Package name', style: textTheme.headline4),
              Text(packageInfo.packageName),
              const Divider(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}
