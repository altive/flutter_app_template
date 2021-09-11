import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../commons/providers/shared_preferences_provider.dart';

/// SharedPreferences で使用するテーマ保存用のキー
const _themePrefsKey = 'selectedThemeKey';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  /// `SharedPreferences` を使用して、記憶しているテーマを取得
  final prefs = ref.watch(sharedPreferencesProvider);
  final index = prefs.getInt(_themePrefsKey) ?? ThemeMode.system.index;
  final themeMode = ThemeMode.values.firstWhere(
    (e) => e.index == index,
    orElse: () => ThemeMode.system,
  );
  return ThemeNotifier(
    prefs: prefs,
    initialThemeMode: themeMode,
  );
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier({
    required this.prefs,
    required ThemeMode initialThemeMode,
  }) : super(initialThemeMode);

  /// 選択したテーマを保存するためのローカル保存領域
  final SharedPreferences prefs;

  /// テーマの変更と保存  を行う
  Future<void> changeAndSave(ThemeMode theme) async {
    await prefs.setInt(_themePrefsKey, theme.index);
    state = theme;
  }
}
