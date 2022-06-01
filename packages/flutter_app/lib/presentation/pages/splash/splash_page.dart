import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/splash_page_body.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SplashPageBody(),
    );
  }
}
