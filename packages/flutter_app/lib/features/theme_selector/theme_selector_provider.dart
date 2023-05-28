import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/providers/shared_preferences_provider.dart';

part 'theme_selector_provider.g.dart';

/// SharedPreferences で使用するテーマ保存用のキー
const _themePrefsKey = 'selectedThemeKey';

@Riverpod(keepAlive: true)
class ThemeSelector extends _$ThemeSelector {
  @override
  ThemeMode build() {
    /// `SharedPreferences` を使用して、記憶しているテーマがあれば取得して反映する。
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

  /// 選択したテーマを保存するためのローカル保存領域
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  /// テーマの変更と保存を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
