import 'package:flutter/material.dart';

import 'text_theme.dart';

final _defaultThemeData = ThemeData.light();

ThemeData get lightThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
  );
}
