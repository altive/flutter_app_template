import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/authenticator/authenticator.dart';
import '../../router/router.dart';
import '../top_level_tab/top_level_tab.dart';
import 'components/providers.dart';
import 'components/splash_page_body.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(splashCountdownProvider.notifier);

    useEffect(
      () {
        Future(() async {
          while (counter.state > 0) {
            await Future<void>.delayed(const Duration(seconds: 1));
            counter.update((state) => state - 1);
          }
          final signedIn = await ref.read(isSignedInProvider.future);
          if (signedIn) {
            const TopLevelTabRoute(tab: TopLevelTab.home).go(context);
            return;
          }
          const SigninRoute().go(context);
        });
        return null;
      },
      const [],
    );

    return const Scaffold(
      body: SplashPageBody(),
    );
  }
}
