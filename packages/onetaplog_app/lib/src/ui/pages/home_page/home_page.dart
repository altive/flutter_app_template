import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/log_card.dart';
import 'components/onetaplog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final existingLogs = ref.watch(existingLgsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Logs')),
      body: SafeArea(
        child: GridView.builder(
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
        ),
      ),
    );
  }
}
