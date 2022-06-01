import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../commons/hooks/hooks.dart';
import '../../../../domain/theme_selector/theme_selector.dart';

class ThemeSelectionPageBody extends HookConsumerWidget {
  const ThemeSelectionPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final themeSelector = ref.watch(themeSelectorProvider.notifier);
    final currentThemeMode = ref.watch(themeSelectorProvider);
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: ThemeMode.values.length,
      itemBuilder: (_, index) {
        final themeMode = ThemeMode.values[index];
        return RadioListTile<ThemeMode>(
          value: themeMode,
          groupValue: currentThemeMode,
          onChanged: (newTheme) => themeSelector.changeAndSave(newTheme!),
          title: Text(themeMode.title(l10n)),
          subtitle: Text(themeMode.subtitle(l10n)),
          secondary: Icon(themeMode.iconData),
        );
      },
    );
  }
}
