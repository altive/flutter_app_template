import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'listen_provider_page/listen_provider_page.dart';
import 'provider_page/provider_page.dart';
import 'state_notifier_provider_page/state_notifier_provider_page.dart';
import 'state_provider_page/state_provider_page.dart';

class RiverpodExamplePage extends StatelessWidget {
  const RiverpodExamplePage({Key? key}) : super(key: key);

  static const String title = 'Riverpod Examples';
  static const String routeName = 'riverpod-example';

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
            onTap: () => Routemaster.of(context).push(ProviderPage.routeName),
            label: ProviderPage.title,
          ),
          _FeatureCard(
            onTap: () =>
                Routemaster.of(context).push(StateProviderPage.routeName),
            label: StateProviderPage.title,
          ),
          _FeatureCard(
            onTap: () => Routemaster.of(context)
                .push(StateNotifierProviderPage.routeName),
            label: StateNotifierProviderPage.title,
          ),
          _FeatureCard(
            onTap: () =>
                Routemaster.of(context).push(ListenProviderPage.routeName),
            label: ListenProviderPage.title,
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

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
