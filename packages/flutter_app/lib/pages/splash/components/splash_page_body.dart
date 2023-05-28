import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/widgets.dart';
import 'providers.dart';

class SplashPageBody extends ConsumerWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleLargeText('Splash'),
          DisplayLargeText('${ref.watch(splashCountdownProvider)}'),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
