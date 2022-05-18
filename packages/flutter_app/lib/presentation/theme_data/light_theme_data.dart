import 'package:flutter/material.dart';

ThemeData get lightThemeData {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
  );
}
