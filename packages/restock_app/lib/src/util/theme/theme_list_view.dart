import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ex_theme.dart';
import 'theme_controller.dart';

/// テーマを選択できる画面
class ThemeListView extends HookConsumerWidget {
  const ThemeListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeColorProvider);
    return ListView.builder(
      itemCount: ExTheme.values.length,
      itemBuilder: (_, index) {
        final themeDataMode = ExTheme.values[index];
        return RadioListTile<ExTheme>(
          value: themeDataMode,
          groupValue: currentTheme,
          onChanged: (newTheme) {
            ref.read(themeColorProvider.notifier).change(newTheme!);
          },
          title: Text(themeDataMode.name!),
          subtitle: Text(themeDataMode.description!),
          secondary: Icon(themeDataMode.icon),
        );
      },
    );
  }
}
