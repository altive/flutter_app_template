import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ranking_note_app/domain/theme_selector/theme_mode_ext.dart';

void main() {
  test('title', () {
    const mode = ThemeMode.system;
    expect(mode.title, 'System');
  });

  test('subtitle', () {
    const mode = ThemeMode.light;
    expect(mode.subtitle, 'Light theme');
  });

  test('iconData', () {
    const mode = ThemeMode.dark;
    expect(mode.iconData, Icons.nightlife);
  });
}
