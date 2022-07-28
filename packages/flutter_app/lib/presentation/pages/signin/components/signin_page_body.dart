import 'package:awaitable_button/awaitable_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/authenticator/authenticator.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../util/localizer/localizer.dart';
import '../../../router/router.dart';
import '../../top_level_tab/top_level_tab.dart';

class SigninPageBody extends HookConsumerWidget {
  const SigninPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final authenticator = ref.watch(authenticatorProvider);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.sampleImages.cats.image().image,
          alignment: Alignment.topCenter,
          fit: BoxFit.contain,
          opacity: 0.8,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
        ],
      ),
    );
  }
}
