import 'package:flutter/material.dart';

final altiveLightColorScheme = ColorScheme.light(
  // ベースカラー
  primary: Colors.teal[900]!,
  // primaryの上に配置されるコンテンツカラー
  onPrimary: Colors.teal[50]!,
  // primaryよりも強調する必要のない要素に適用されるカラー
  primaryContainer: Colors.teal[400],
  // primaryContainerの上に配置されるコンテンツカラー
  onPrimaryContainer: Colors.teal[900],
);
