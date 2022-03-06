import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ranking_note_app/commons/providers/shared_preferences_provider.dart';
import 'package:ranking_note_app/domain/theme_selector/theme_selector.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeSelector', () {
    late ProviderContainer container;
    setUp(() {
      return Future(() async {
        SharedPreferences.setMockInitialValues({});
        final sp = await SharedPreferences.getInstance();
        container = ProviderContainer(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sp),
          ],
        );
      });
    });

    tearDown(() {
      // テストごとにProviderContainerを破棄する。
      container.dispose();
    });

    test('初期テーマが[ThemeMode.system]なこと', () {
      // テスト対象のクラスをコンテナから取得する。
      final themeMode = container.read(themeSelectorProvider);
      expect(themeMode, ThemeMode.system);
    });

    test('ローカル保存領域に保存されていた場合は、そのテーマになっていること', () async {
      const lightIndex = 1;
      SharedPreferences.setMockInitialValues({'selectedThemeKey': lightIndex});

      final sp = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(sp)],
      );

      final themeMode = container.read(themeSelectorProvider);
      expect(themeMode, ThemeMode.light);
    });

    test('Darkテーマに切り替えられ、ローカル記憶領域にも保存されていること', () async {
      // テスト対象のクラスをコンテナから取得する。
      final themeNotifier = container.read(themeSelectorProvider.notifier);
      // テスト対象のメソッドを、任意の引数で実行する。
      await themeNotifier.changeAndSave(ThemeMode.dark);
      expect(themeNotifier.debugState, ThemeMode.dark);

      final sp = container.read(sharedPreferencesProvider);
      final themeIndex = sp.getInt('selectedThemeKey');
      expect(themeIndex, 2);
    });
  });
}
