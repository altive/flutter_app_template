import 'package:flutter/material.dart';

InputDecorationTheme appInputDecorationTheme({
  required ColorScheme colorScheme,
}) {
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    filled: true,
    fillColor: colorScheme.onBackground.withOpacity(0.1),
  );
}
