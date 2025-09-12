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
    // Providerを読み取る。 `.notifier` を付けると `StateController` が、
    // 付けなければ、 `state` つまり int が取得できる。
    final counter = ref.watch(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // counterProviderの状態（カウント数）をTextで表示
              DisplayLargeText('Count: ${ref.watch(counterProvider)}'),
              const Gap(32),
              ElevatedButton(
                // ボタンタップでcounterProviderの状態をプラス１する
                // ↓ `counter.state++` や、
                // ↓ `counter.state = counter.state + 1` と書いても同じ。
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
