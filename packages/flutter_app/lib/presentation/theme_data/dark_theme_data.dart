import 'package:flutter/material.dart';

ThemeData get darkThemeData {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(),
  );
}
