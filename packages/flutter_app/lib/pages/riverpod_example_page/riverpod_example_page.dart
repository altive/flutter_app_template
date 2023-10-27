import 'package:flutter/material.dart';

import '../../router/router.dart';
import 'async_notifier_provider_page/async_notifier_provider_page.dart';
import 'listen_provider_page/listen_provider_page.dart';
import 'notifier_provider_page/notifier_provider_page.dart';
import 'provider_page/provider_page.dart';
import 'state_notifier_provider_page/state_notifier_provider_page.dart';
import 'state_provider_page/state_provider_page.dart';
import 'stream_provider_page.dart/stream_provider_page.dart';

class RiverpodExamplePage extends StatelessWidget {
  const RiverpodExamplePage({
    super.key,
  });

  static const String title = 'Riverpod Examples';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _FeatureCard(
            onTap: () => const ProviderRouteData().go(context),
            label: ProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const StateProviderRouteData().go(context),
            label: StateProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const StreamProviderRouteData().go(context),
            label: StreamProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const NotifierProviderRouteData().go(context),
            label: NotifierProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const AsyncNotifierProviderRouteData().go(context),
            label: AsyncNotifierProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const StateNotifierProviderRouteData().go(context),
            label: StateNotifierProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => const ListenProviderRouteData().go(context),
            label: ListenProviderPage.title,
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.onTap,
    required this.label,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
