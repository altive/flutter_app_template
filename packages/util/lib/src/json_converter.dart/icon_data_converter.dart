import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

/// Returns a constant [IconDataConverter].
const iconDataConverter = IconDataConverter();

/// Converter for inter-conversion between IconData and int (codePoint).
class IconDataConverter implements JsonConverter<IconData, int> {
  /// Creates a new instance of [IconDataConverter].
  const IconDataConverter();

  @override
  IconData fromJson(int json) => IconData(json);

  @override
  int toJson(IconData object) => object.codePoint;
}
