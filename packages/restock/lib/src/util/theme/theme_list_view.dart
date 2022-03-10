import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ex_theme.dart';
import 'theme_controller.dart';

/// テーマを選択できる画面
class ThemeListView extends HookWidget {
  const ThemeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = useProvider(themeColorProvider);
    return ListView.builder(
      itemCount: ExTheme.values.length,
      itemBuilder: (_, index) {
        final themeDataMode = ExTheme.values[index];
        return RadioListTile<ExTheme>(
          value: themeDataMode,
          groupValue: currentTheme,
          onChanged: (newTheme) {
            context.read(themeColorProvider.notifier).change(newTheme!);
          },
          title: Text(themeDataMode.name!),
          subtitle: Text(themeDataMode.description!),
          secondary: Icon(themeDataMode.icon),
          controlAffinity: ListTileControlAffinity.platform,
        );
      },
    );
  }
}
