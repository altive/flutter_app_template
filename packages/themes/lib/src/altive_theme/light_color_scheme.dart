import 'package:flutter/material.dart';

/// A [ColorScheme] for light theme.
final lightColorScheme = ColorScheme.light(
  // Primary color of the app.
  primary: Colors.teal[900]!,
  // Content color placed on top of primary
  onPrimary: Colors.teal[50]!,
  // Color applied to elements that don't need as much emphasis as primary
  primaryContainer: Colors.teal[400],
  // Content color placed on top of primaryContainer
  onPrimaryContainer: Colors.teal[900],
);
