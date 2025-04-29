import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/providers/shared_preferences_provider.dart';

part 'theme_selector_provider.g.dart';

/// Provider for selecting the theme.
@riverpod
class ThemeSelector extends _$ThemeSelector {
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
