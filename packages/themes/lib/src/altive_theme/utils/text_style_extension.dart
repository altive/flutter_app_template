import 'package:flutter/material.dart';

/// Extension methods for [TextStyle].
/// It's convenient to define commonly used `copyWith` patterns here.
extension TextStyleExtension on TextStyle {
  /// Returns a [TextStyle] with [height] set to 1.
  TextStyle get withHeight1 => copyWith(height: 1);

  /// Returns a [TextStyle] with [fontWeight] set to [FontWeight.bold].
  TextStyle get withBold => copyWith(fontWeight: FontWeight.bold);
}
