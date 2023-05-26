import 'package:flutter/material.dart';

/// [TextStyle] の拡張メソッド。
/// よく `copyWith` して使用するものは、こちらに定義しておくと便利。
extension TextStyleExtension on TextStyle {
  /// [height] を1にした [TextStyle] を返す
  TextStyle get withHeight1 => copyWith(height: 1);

  /// [fontWeight] を [FontWeight.bold] にした [TextStyle] を返す
  TextStyle get withBold => copyWith(fontWeight: FontWeight.bold);
}
