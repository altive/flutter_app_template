import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../ranking_list_page/ranking_list_page.dart';
import '../riverpod_example_page/riverpod_example_page.dart';
import '../theme_selection_page/theme_selection_page.dart';

/// デモ機能をリスト表示する
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    debugPrint('Locale: ${Localizations.localeOf(context)}');
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _FeatureCard(
            onTap: () => Routemaster.of(context).push('app-info'),
            label: 'App Info',
          ),
          _FeatureCard(
            onTap: () =>
                Routemaster.of(context).push(RiverpodExamplePage.routeName),
            label: 'Riverpod Examples',
          ),
          _FeatureCard(
            onTap: () =>
                Routemaster.of(context).push(RankingListPage.routeName),
            label: 'My Ranking list',
          ),
          _FeatureCard(
            onTap: () =>
                Routemaster.of(context).push(ThemeSelectionPage.routeName),
            label: 'Theme Selector',
          ),
          _FeatureCard(
            onTap: () => Routemaster.of(context).push('hello-world'),
            label: 'To 404',
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
