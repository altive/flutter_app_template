import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

import '../../../widgets/widgets.dart';

// Provider example.
final StateProvider<int> counterProvider = StateProvider((ref) => 0);

// Widget example.
class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  static const title = 'StateProvider';
  static const routeName = 'state-provider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read the Provider. With `.notifier` you get `StateController`,
    // without it you get the `state` (int).
    final counter = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the state (count) of counterProvider with Text
              DisplayLargeText('Count: ${ref.watch(counterProvider)}'),
              const Gap(32),
              ElevatedButton(
                // Increment the counterProvider state by 1 on button tap
                // Same as writing `counter.state++` or
                // `counter.state = counter.state + 1`.
                onPressed: () => counter.update((state) => state + 1),
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
