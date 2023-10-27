import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplorePage extends HookConsumerWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(counter.value.toString(), textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(16),
            child: IconButton.filled(
              onPressed: () => counter.value++,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
