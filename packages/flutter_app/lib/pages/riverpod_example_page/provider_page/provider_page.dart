import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

import '../../../gen/strings.g.dart';
import '../../../widgets/widgets.dart';

// Provider example.

// Counter Provider to increment the value by 1
final StateProvider<int> counterProvider = StateProvider((ref) => 0);

// Provider that provides double the counter value
final Provider<int> doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

// Widget example.
class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  static const title = 'ProviderPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read doubleCounterProvider.
    // When counterProvider state is updated, doubleCounterProvider also
    // changes and rebuilds.
    final doubleCount = ref.watch(doubleCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DisplaySmallText(
                Translations.of(context).homePage.list.doubleCount,
              ),
              // Display the value of doubleCounterProvider
              DisplayLargeText('$doubleCount'),
              ElevatedButton(
                // Increment the value of counterProvider by 1.
                onPressed: () => ref
                    .read(counterProvider.notifier)
                    .update((state) => state + 1),
                child: const Text('Increase Count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
