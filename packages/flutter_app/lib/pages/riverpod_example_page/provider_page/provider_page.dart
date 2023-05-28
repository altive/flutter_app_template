import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../widgets/widgets.dart';

// Provider example.

// 1ずつ値を増加させるためのカウンターProvider
final counterProvider = StateProvider((ref) => 0);

// カウンターの値を2倍にした値を提供するProvider
final doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

// Widget example.
class ProviderPage extends ConsumerWidget {
  const ProviderPage({
    super.key,
  });

  static const String title = 'ProviderPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // doubleCounterProvider を読み取る。
    // counterProvider の状態が更新されると doubleCounterProvider も変更され、再構築される。
    final doubleCount = ref.watch(doubleCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DisplaySmallText('2倍されたカウント値：'),
              // doubleCounterProvider の値を表示
              DisplayLargeText('$doubleCount'),
              ElevatedButton(
                // counterProvider の値を+1する。
                onPressed: () => ref.read(counterProvider.notifier).update(
                      (state) => state + 1,
                    ),
                child: const Text('Increase Count'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
