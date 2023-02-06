import 'package:flutter/material.dart';
import 'package:flutter_app/features/theme_selector/theme_mode_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('iconData', () {
    const mode = ThemeMode.dark;
    expect(mode.iconData, Icons.nightlife);
  });
}
