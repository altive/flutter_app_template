import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/providers/shared_preferences_provider.dart';

/// Provider for selecting the theme.
final themeSelectorProvider = NotifierProvider<ThemeSelector, ThemeMode>(
  ThemeSelector.new,
);

class ThemeSelector extends Notifier<ThemeMode> {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  /// Key for storing the selected theme.
  @visibleForTesting
  static const themePrefsKey = 'selectedThemeKey';

  @override
  ThemeMode build() {
    final pref = ref.watch(sharedPreferencesProvider);
    final themeIndex = pref.getInt(themePrefsKey);
    if (themeIndex == null) {
      return ThemeMode.system;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    return themeMode;
  }

  /// Change the theme and save it.
  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(themePrefsKey, theme.index);
    state = theme;
  }
}
