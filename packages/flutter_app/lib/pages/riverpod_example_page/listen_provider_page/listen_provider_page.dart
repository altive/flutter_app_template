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

  static const title = 'Listen Provider';
  static const routeName = 'listen-provider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      // Use listenManual when you want to subscribe from outside the
      // build method, such as in initState or useEffect.
      ref.listenManual(
        countStateProvider,
        fireImmediately: true,
        (prev, next) {
          // Show the dialog after the entire widget tree has been built.
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
        // Error handling (optional)
        onError: (error, stackTrace) => logger.warning(error),
      );
      return null;
    }, const []);

    //
    //
    // Inside build, use ref.listen.
    ref.listen(countStateProvider, (previous, next) async {
      // Show dialog only when the Counter value becomes even
      if (next.isEven) {
        return;
      }
      logger.fine('Prev number is $previous, Next number is $next!');
    }, onError: (error, stackTrace) => logger.warning('$error'));

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display the state (count) of countStateProvider with Text
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
