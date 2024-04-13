import 'package:flutter/material.dart';
import 'package:flutter_app/features/theme_selector/theme_selector.dart';
import 'package:flutter_app/util/providers/shared_preferences_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
      container.dispose();
    });

    test('Initial theme is system', () {
      final themeMode = container.read(themeSelectorProvider);
      expect(themeMode, ThemeMode.system);
    });

    test(
      'If it was saved in the local storage area, it must be on that theme.',
      () async {
        const lightIndex = 1;
        SharedPreferences.setMockInitialValues(
          {'selectedThemeKey': lightIndex},
        );

        final sp = await SharedPreferences.getInstance();
        container = ProviderContainer(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sp),
          ],
        );

        final themeMode = container.read(themeSelectorProvider);
        expect(themeMode, ThemeMode.light);
      },
    );

    test(
      'Must be switched to the Dark theme and also stored in local storage.',
      () async {
        final themeNotifier = container.read(themeSelectorProvider.notifier);

        await themeNotifier.changeAndSave(ThemeMode.dark);
        final themeMode = container.read(themeSelectorProvider);
        expect(themeMode, ThemeMode.dark);

        final sp = container.read(sharedPreferencesProvider);
        final themeIndex = sp.getInt('selectedThemeKey');
        expect(themeIndex, 2);
      },
    );
  });
}
