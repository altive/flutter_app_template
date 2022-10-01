import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewOnetapLogPageBody extends ConsumerWidget {
  const NewOnetapLogPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 基本情報ゾーン
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: DefaultTextStyle(
                style: TextStyle(color: colorScheme.onPrimary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('タイトル（必須）'),
                    const Gap(4),
                    TextField(
                      decoration: InputDecoration(
                        helperText: '例：水を飲んだ, 散歩した, ミルクをあげた',
                        helperStyle: TextStyle(color: colorScheme.onPrimary),
                      ),
                    ),
                    const Gap(16),
                    const Text('メモ'),
                    const Gap(4),
                    const TextField(),
                  ],
                ),
              ),
            ),
            // 任意情報ゾーン
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: colorScheme.onPrimary.withOpacity(0.3),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: DefaultTextStyle(
                style: TextStyle(color: colorScheme.onPrimary),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('単位'),
                          const Gap(4),
                          TextField(
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              helperText: '例：回, 個',
                              helperStyle:
                                  TextStyle(color: colorScheme.onPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('アイコン'),
                          const Gap(4),
                          TextField(
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              helperText: '例：回, 個',
                              helperStyle:
                                  TextStyle(color: colorScheme.onPrimary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 危険ゾーン
            ColoredBox(
              color: colorScheme.onPrimary.withOpacity(0.3),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '危険領域',
                      style: TextStyle(color: colorScheme.error),
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text('このログを削除する'),
                        ),
                        Flexible(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              '削除',
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text('ログをリセットする'),
                        ),
                        Flexible(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'りセット',
                              style: TextStyle(color: colorScheme.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
