import 'package:flutter/material.dart';

/// A [ColorScheme] for dark theme.
ColorScheme get darkColorScheme => ColorScheme.fromSeed(
  seedColor: Colors.brown,
  brightness: Brightness.dark,
  dynamicSchemeVariant: DynamicSchemeVariant.neutral,
  contrastLevel: 0.5,
);
