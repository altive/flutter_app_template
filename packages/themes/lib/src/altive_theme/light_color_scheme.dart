import 'package:flutter/material.dart';

/// A [ColorScheme] for light theme.
final lightColorScheme = ColorScheme.light(
  // Primary color of the app.
  primary: Colors.teal[900]!,
  // primaryの上に配置されるコンテンツカラー
  onPrimary: Colors.teal[50]!,
  // primaryよりも強調する必要のない要素に適用されるカラー
  primaryContainer: Colors.teal[400],
  // primaryContainerの上に配置されるコンテンツカラー
  onPrimaryContainer: Colors.teal[900],
);
