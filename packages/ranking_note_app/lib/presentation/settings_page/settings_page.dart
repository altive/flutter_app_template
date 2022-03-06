import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/rounded_card.dart';
import '../router/router.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = 'settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _ListTile(
              isFirst: true,
              titleLabel: 'Change theme',
              icon: const Icon(Icons.palette),
              onTap: ref.read(routerProvider).navigateToThemeSelectionPage,
            ),
            _ListTile(
              isLast: true,
              titleLabel: 'Your Account',
              icon: const Icon(Icons.account_circle),
              onTap: ref.read(routerProvider).navigateToAccountPage,
            )
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.titleLabel,
    this.icon,
    required this.onTap,
    this.isFirst = false,
    this.isLast = false,
  }) : super(key: key);

  final String titleLabel;
  final Icon? icon;
  final VoidCallback onTap;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
      child: ListTile(
        onTap: onTap,
        title: Text(titleLabel),
        leading: icon,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
