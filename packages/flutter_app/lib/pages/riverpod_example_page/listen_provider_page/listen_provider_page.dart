import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/logger.dart';
import '../../../widgets/widgets.dart';
import '../component/count_state_provider.dart';

// Widget example.
class ListenProviderPage extends HookConsumerWidget {
  const ListenProviderPage({super.key});

  static String title = 'Listen Provider';
  static String routeName = 'listen-provider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        // initStateやuseEffect等、build外から購読したい時は、listenManualを使う。
        ref.listenManual(
          countStateProvider,
          fireImmediately: true,
          (prev, next) {
            // Widgetツリーが全体がビルドされた後にダイアログを表示する。
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Prev number is $prev, Next number is $next!'),
                  );
                },
              );
            });
          },
          // エラーハンドリング（省略可能）
          onError: (error, stackTrace) => logger.warning(error),
        );
        return null;
      },
      const [],
    );

    // build内では、ref.listenを使う。
    ref.listen(
      countStateProvider,
      (previous, next) async {
        // Counterの数値が偶数になったときにだけダイアログを表示する
        if (next.isEven) {
          return;
        }
        logger.fine('Prev number is $previous, Next number is $next!');
      },
      onError: (error, stackTrace) => logger.warning('$error'),
    );

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // countStateProviderの状態（カウント数）をTextで表示
              DisplayLargeText('Count: ${ref.watch(countStateProvider)}'),
              const Gap(32),
              FilledButton(
                onPressed: () =>
                    ref.read(countStateProvider.notifier).increment(),
                child: const Text('Increment'),
              ),
              const Gap(16),
              OutlinedButton(
                onPressed: () => ref.read(countStateProvider.notifier).reset(),
                child: const Text('Reset'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
