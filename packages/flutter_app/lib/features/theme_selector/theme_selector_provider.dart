import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/providers/shared_preferences_provider.dart';

part 'theme_selector_provider.g.dart';

const _themePrefsKey = 'selectedThemeKey';

@riverpod
class ThemeSelector extends _$ThemeSelector {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  @override
  ThemeMode build() {
    final pref = ref.watch(sharedPreferencesProvider);
    final themeIndex = pref.getInt(_themePrefsKey);
    if (themeIndex == null) {
      return ThemeMode.system;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    return themeMode;
  }

  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
