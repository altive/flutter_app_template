import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

const colorConverter = ColorConverter();

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}
