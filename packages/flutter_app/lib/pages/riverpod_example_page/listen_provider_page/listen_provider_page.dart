import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/logger.dart';
import '../../../widgets/widgets.dart';

// Provider example.
final counterProvider = StateProvider((ref) => 0);

// Widget example.
class ListenProviderPage extends ConsumerWidget {
  const ListenProviderPage({super.key});

  static String title = 'Listen Provider';
  static String routeName = 'listen-provider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを購読する
    ref.listen<int>(
      counterProvider,
      (previous, next) async {
        // Counterの数値が偶数になったときにだけダイアログを表示する
        if (next.isEven) {
          return;
        }
        await showDialog<void>(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Current number is Odd !!'),
            );
          },
        );
      },
      // エラーハンドリング（省略可能）
      onError: (error, stackTrace) => logger.warning('$error'),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
                onPressed: () => ref
                    .read(counterProvider.notifier)
                    .update((state) => state + 1),
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
