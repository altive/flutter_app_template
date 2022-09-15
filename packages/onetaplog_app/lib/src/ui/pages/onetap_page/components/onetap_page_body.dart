import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'log_card.dart';
import 'onetaplog.dart';

class OnetapPageBody extends ConsumerWidget {
  const OnetapPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final existingLogs = ref.watch(existingLgsProvider);

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: existingLogs.length,
      itemBuilder: (context, index) {
        return ProviderScope(
          overrides: [
            logProvider.overrideWithValue(existingLogs[index]),
          ],
          child: const LogCard(),
        );
      },
    );
  }
}
