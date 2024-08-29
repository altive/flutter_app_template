import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themes/themes.dart';

import '../../features/theme_selector/theme_selector.dart';
import '../../gen/strings.g.dart';
import '../../widgets/widgets.dart';

/// Page for selecting a theme.
class ThemeSelectionPage extends StatelessWidget {
  /// Creates a new instance of [ThemeSelectionPage].
  const ThemeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final themeDescription = context.themeDescription;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.theme.selection.page.appBar.title),
        actions: [
          themeDescription.icon,
          Align(
            child: TitleLargeText(themeDescription.title),
          ),
          const Gap(16),
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

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
