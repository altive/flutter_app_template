import 'package:flutter/material.dart';

import 'text_theme.dart';

final _defaultThemeData = ThemeData.dark();

ThemeData get darkThemeData {
  return _defaultThemeData.copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
    textTheme: _defaultThemeData.textTheme.merge(textTheme),
  );
}
