import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/router.dart';
import '../top_level_tab_page/top_level_tab.dart';
import 'components/splash_page_app_bar.dart';
import 'components/splash_page_body.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    useEffect(
      () {
        Future(() async {
          await Future<void>.delayed(const Duration(seconds: 1));
          // final signedIn = await ref.read(isSignedInProvider.future);
          if (!isMounted()) {
            return;
          }
          // if (signedIn) {
          // ignore: use_build_context_synchronously
          const TopLevelTabRoute(tab: TopLevelTab.onetap).go(context);
          // return;
          // }
          // ignore: use_build_context_synchronously
          // const SigninRoute().go(context);
        });
        return null;
      },
      const [],
    );
    return Scaffold(
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SplashPageAppBar(),
            SplashPageBody(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        items: [
          for (final tab in TopLevelTab.values)
            BottomNavigationBarItem(
              icon: Icon(tab.activeIconData),
              label: tab.labelText(),
            ),
        ],
      ),
    );
  }
}
