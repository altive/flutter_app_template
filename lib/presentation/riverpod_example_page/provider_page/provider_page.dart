import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider example.

// 1ずつ値を増加させるためのカウンターProvider
final counterProvider = StateProvider((ref) => 0);

// カウンターの値を2倍にした値を提供するProvider
final doubleCounterProvider = Provider((ref) {
  final counter = ref.watch(counterProvider).state;
  return counter * 2;
});

// Widget example.
class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  static const String title = 'ProviderPage';
  static const String routeName = 'provider-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // doubleCounterProvider を読み取る。
    // counterProvider の状態が更新されると doubleCounterProvider も変更され、再構築される。
    final doubleCount = ref.watch(doubleCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Column(
        children: [
          const Text('カウント値：'),
          // doubleCounterProvider の値を表示
          Text('2倍されたカウント値：$doubleCount'),
          ElevatedButton(
            // counterProvider の値を+1する。
            onPressed: () => ref.read(counterProvider).state++,
            child: const Text('Increase Count'),
          ),
        ],
      ),
    );
  }
}
