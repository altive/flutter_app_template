import 'package:flutter/material.dart';

/// A [ColorScheme] for light theme.
ColorScheme get lightColorScheme => ColorScheme.fromSeed(
  seedColor: Colors.brown,
  dynamicSchemeVariant: DynamicSchemeVariant.neutral,
  contrastLevel: 0.5,
);
