import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

/// Returns a constant [ColorConverter].
const colorConverter = ColorConverter();

/// Converter for inter-conversion between aRGB (hexadecimal) and Color.
class ColorConverter implements JsonConverter<Color, int> {
  /// Creates a new instance of [ColorConverter].
  const ColorConverter();

  @override
  // Since it is a Converter, a Color constructor is required.
  // ignore: avoid_hardcoded_color
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) {
    final a = (object.a * 255).toInt() & 0xFF;
    final r = (object.r * 255).toInt() & 0xFF;
    final g = (object.g * 255).toInt() & 0xFF;
    final b = (object.b * 255).toInt() & 0xFF;
    return (a << 24) | (r << 16) | (g << 8) | b;
  }
}
