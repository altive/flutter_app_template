import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../widgets/widgets.dart';

part 'stream_provider_page.g.dart';

// Provider example.

/// 従来の記法
/// 1秒ずつにカウントをインクリメントする。
final countOldSyntaxProvider = StreamProvider.autoDispose(
  (ref) {
    return Stream<int>.periodic(
      const Duration(seconds: 1),
      (count) => count,
    );
  },
);

/// コード生成記法
/// 1秒ずつにカウントをインクリメントする。
@riverpod
Stream<int> count(CountRef ref) {
  return Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) => count,
  );
}

// Widget example.
class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({
    super.key,
  });

  static const String title = 'StreamProviderPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // doubleCounterProvider を読み取る。
    // counterProvider の状態が更新されると doubleCounterProvider も変更され、再構築される。
    final asyncCount = ref.watch(countProvider);

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DisplaySmallText('Increment with stream:'),
              const Gap(16),
              // countProvider の値を表示
              asyncCount.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => OutlinedButton(
                  onPressed: () => ref.invalidate(countProvider),
                  child: const Text('Refresh'),
                ),
                data: (count) {
                  return DisplayLargeText('$count');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
