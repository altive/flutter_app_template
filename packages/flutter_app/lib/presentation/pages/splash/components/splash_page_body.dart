import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers.dart';

class SplashPageBody extends ConsumerWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Splash',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '${ref.watch(splashCountdownProvider)}',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
