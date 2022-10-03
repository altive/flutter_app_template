import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'log_card.dart';
import 'onetaplog.dart';

class OnetapPageBody extends ConsumerWidget {
  const OnetapPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final existingLogs = ref.watch(existingLgsProvider);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)
          .add(EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom)),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: existingLogs.length,
          (context, index) {
            return ProviderScope(
              overrides: [
                logProvider.overrideWithValue(existingLogs[index]),
              ],
              child: const LogCard(),
            );
          },
        ),
      ),
    );
  }
}
