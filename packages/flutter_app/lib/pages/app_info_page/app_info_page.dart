import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../environment/environment.dart';
import '../../gen/strings.g.dart';
import '../../package_adaptor/package_info_provider.dart';
import '../../widgets/widgets.dart';

/// A page for app information.
class AppInfoPage extends StatelessWidget {
  /// Creates a new instance of [AppInfoPage].
  const AppInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.appInfo.appBar.title),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: _Body(),
        ),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return ListView(
      children: <Widget>[
        Text(t.title),
        const Gap(8),
        Text('Author is ${t.author.name}.'),
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
        const Gap(32),
        const TitleLargeText('Mode'),
        const Text(
          kReleaseMode
              ? 'Release'
              : kProfileMode
                  ? 'Profile'
                  : kDebugMode
                      ? 'Debug'
                      : 'unknown',
        ),
      ],
    );
  }
}
