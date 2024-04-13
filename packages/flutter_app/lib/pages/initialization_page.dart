import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../initialization_provider.dart';

class InitializationPage extends ConsumerWidget {
  const InitializationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(initializationProvider)) {
      AsyncData(isLoading: false) => throw AssertionError(),
      AsyncError(:final error) => _ErrorPage(
          error,
          onRetry: () => ref.invalidate(initializationProvider),
        ),
      _ => const _LoadingPage(),
    };
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ErrorPage extends StatelessWidget {
  const _ErrorPage(this.error, {required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Gap(16),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
