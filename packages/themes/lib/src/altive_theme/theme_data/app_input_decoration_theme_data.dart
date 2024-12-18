import 'package:flutter/material.dart';

/// A [InputDecorationTheme] for the app.
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
    fillColor: colorScheme.onSurface.withValues(alpha: 0.1),
  );
}
