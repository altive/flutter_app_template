import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/theme_selector/theme_selector.dart';
import '../../../gen/strings.g.dart';

class ThemeSelectionPageBody extends HookConsumerWidget {
  const ThemeSelectionPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);
    final t = Translations.of(context);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: ThemeMode.values.length,
      itemBuilder: (_, index) {
        final themeMode = ThemeMode.values[index];
        return RadioListTile<ThemeMode>(
          value: themeMode,
          groupValue: currentThemeMode,
          onChanged: (newTheme) async => themeSelector.changeAndSave(newTheme!),
          title: Text(themeMode.title(t)),
          subtitle: Text(themeMode.subtitle(t)),
          secondary: Icon(themeMode.iconData),
        );
      },
    );
  }
}
