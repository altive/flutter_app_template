import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/theme_selector/theme_selector.dart';
import '../components/rounded_card.dart';

class ThemeSelectionPage extends StatelessWidget {
  const ThemeSelectionPage({Key? key}) : super(key: key);

  static const String routeName = 'theme-selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme selection')),
      body: const SafeArea(
        child: ThemeListView(),
      ),
    );
  }
}

class ThemeListView extends ConsumerWidget {
  const ThemeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ThemeMode.values.length,
      itemBuilder: (_, index) {
        final themeMode = ThemeMode.values[index];
        return RoundedCard(
          isFirst: index == 0,
          isLast: index == ThemeMode.values.length - 1,
          child: RadioListTile<ThemeMode>(
            value: themeMode,
            groupValue: currentThemeMode,
            onChanged: (newTheme) => themeSelector.changeAndSave(newTheme!),
            title: Text(themeMode.title),
            subtitle: Text(themeMode.subtitle),
            secondary: Icon(themeMode.iconData),
          ),
        );
      },
    );
  }
}
