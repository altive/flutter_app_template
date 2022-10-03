import 'package:authenticator/authenticator.dart';
import 'package:awaitable_button/awaitable_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../environment/environment.dart';
import '../../../router/router.dart';
import '../../../util/localizer/localizer.dart';
import '../../../util/providers/package_info_provider.dart';
import '../../top_level_tab/top_level_tab.dart';

class SigninPageBody extends HookConsumerWidget {
  const SigninPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final authenticator = ref.watch(authenticatorProvider);
    final flavor = ref.watch(flavorProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          AwaitableFilledTonalButton<void>(
            onPressed: null,
            child: Text(l10n.signInPageGoogleButton),
          ),
          const Gap(16),
          AwaitableFilledTonalButton<void>(
            onPressed: null,
            child: Text(l10n.signInPageAppleButton),
          ),
          const Gap(16),
          AwaitableTextButton<void>(
            onPressed: authenticator.signInAnonymously,
            whenComplete: (_) =>
                const TopLevelTabRoute(tab: TopLevelTab.home).go(context),
            child: Text(l10n.signInPageAnonymousButton),
          ),
          const Divider(),
          ListTile(
            title: const Text('Version:'),
            subtitle: Text('${packageInfo.version}+${packageInfo.buildNumber}'),
          ),
          ListTile(
            title: const Text('Environment:'),
            subtitle: Text(flavor.name),
          ),
          ListTile(
            title: const Text('Bundle ID (Package name):'),
            subtitle: Text(packageInfo.packageName),
          ),
        ],
      ),
    );
  }
}
