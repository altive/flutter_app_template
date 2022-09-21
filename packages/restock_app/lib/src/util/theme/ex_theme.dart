import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'restock_dark_theme_data.dart';
import 'restock_light_theme_data.dart';

/// 独自のテーマモード
// 順序を変更すると表示される順番も変わる
enum ExTheme {
  system,
  defaultLight,
  defaultDark,
}

extension Extension on ExTheme {
  /// ID：変更不可
  int get id {
    switch (this) {
      case ExTheme.system:
        return 1000;

      case ExTheme.defaultLight:
        return 1001;

      case ExTheme.defaultDark:
        return 1002;
    }
  }

  /// 名前
  String? get name {
    switch (this) {
      case ExTheme.system:
        return 'システム';

      case ExTheme.defaultLight:
        return 'ライト';

      case ExTheme.defaultDark:
        return 'ダーク';
    }
  }

  /// 説明
  String? get description {
    switch (this) {
      case ExTheme.system:
        return '端末の設定に追従';

      case ExTheme.defaultLight:
        return '明るい背景に暗い文字';

      case ExTheme.defaultDark:
        return '暗い背景に明るい文字';
    }
  }

  /// アイコン
  IconData? get icon {
    switch (this) {
      case ExTheme.system:
        return MdiIcons.themeLightDark;

      case ExTheme.defaultLight:
        return MdiIcons.weatherSunny;

      case ExTheme.defaultDark:
        return MdiIcons.weatherNight;
    }
  }

  ThemeData? get themeData {
    switch (this) {
      case ExTheme.system:
        return restockLightThemeData;

      case ExTheme.defaultLight:
        return restockLightThemeData;

      case ExTheme.defaultDark:
        return restockDarkThemeData;
    }
  }

  /// ダークモードを有効にしたいテーマモードの場合に設定する
  ThemeData? get darkThemeData {
    switch (this) {
      case ExTheme.system:
        return restockDarkThemeData;

      case ExTheme.defaultLight:
        return null;

      case ExTheme.defaultDark:
        return null;
    }
  }
}
