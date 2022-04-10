import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final flavorProvider = Provider<Flavor>((ref) => throw UnimplementedError());

enum Flavor {
  development,
  staging,
  production,
}

extension FlavorExt on Flavor {
  /// 実行環境がDevelopment環境かどうか
  bool get isDevelopment => this == Flavor.development;

  /// 実行環境がStaging環境かどうか
  bool get isStaging => this == Flavor.staging;

  /// 実行環境がProduction環境かどうか
  bool get isProduction => this == Flavor.production;

  /// アイコンのアセットパス
  String get asset => 'assets/app_icons/icon-$name.png';

  /// 表示文字列
  String get label {
    switch (this) {
      case Flavor.development:
        return 'Dev';
      case Flavor.staging:
        return 'Stg';
      case Flavor.production:
        return '';
    }
  }

  /// 各Flavorを表す色
  Color get color {
    switch (this) {
      case Flavor.development:
        return const Color(0xFF92C530);
      case Flavor.staging:
        return const Color(0xFF00A3E9);
      case Flavor.production:
        return const Color(0xFFF0BC1B);
    }
  }
}
