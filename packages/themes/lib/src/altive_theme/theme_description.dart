import 'dart:math';

import 'package:flutter/material.dart';

class ThemeDescription extends ThemeExtension<ThemeDescription> {
  ThemeDescription({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final Icon icon;

  @override
  ThemeDescription copyWith({
    String? title,
    String? subtitle,
    Icon? icon,
  }) {
    return ThemeDescription(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      icon: icon ?? this.icon,
    );
  }

  @override
  ThemeDescription lerp(
    ThemeExtension<ThemeDescription>? other,
    double t,
  ) {
    if (other is! ThemeDescription) {
      return this;
    }
    return ThemeDescription(
      title: _genInterimText(prev: title, next: other.title, t: t),
      subtitle: _genInterimText(prev: subtitle, next: other.subtitle, t: t),
      icon: _genInterimIcon(prev: icon, next: other.icon, t: t),
    );
  }

  /// 中間テキストを生成する
  String _genInterimText({
    required String prev,
    required String next,
    required double t,
  }) {
    final substringLength = prev.length - (prev.length * t).round();
    final left = prev.substring(0, substringLength);
    final right = next.substring(
      min(next.length, substringLength),
      next.length,
    );

    return '$left$right';
  }

  /// 中間アイコンを生成する
  Icon _genInterimIcon({
    required Icon prev,
    required Icon next,
    required double t,
  }) {
    return Icon(
      t < 0.5 ? prev.icon : next.icon,
      color: Color.lerp(prev.color, next.color, t),
    );
  }
}
