import 'package:flutter/material.dart';

/// ストックアイテムのカテゴリー
enum MyStockCategory {
  grocery,
  others,
}

extension MyStockCategoryEx on MyStockCategory {
  /// StringからStockItemCategoryを生成する
  static MyStockCategory fromString(String? text) {
    switch (text) {
      case 'Grocery':
        return MyStockCategory.grocery;
      default:
        return MyStockCategory.others;
    }
  }

  /// enumの文字列を返却
  String get string {
    switch (this) {
      case MyStockCategory.grocery:
        return 'Grocery';
      case MyStockCategory.others:
        return 'Others';
    }
  }

  /// 表示用ラベル
  String get displayLabel {
    switch (this) {
      case MyStockCategory.grocery:
        return '食品';
      case MyStockCategory.others:
        return 'その他';
    }
  }

  /// 表示用ラベル
  Color? get color {
    switch (this) {
      case MyStockCategory.grocery:
        return const Color(0xFFF0BC1B);
      case MyStockCategory.others:
        return Colors.grey[400];
    }
  }
}

extension MyStockCategoryNullableExt on MyStockCategory? {
  /// enumの文字列を返却
  String? get string {
    if (this == null) {
      return null;
    }
    return this!.string;
  }

  /// 表示用ラベル
  String? get displayLabel {
    if (this == null) {
      return null;
    }
    return this!.displayLabel;
  }

  /// 表示用ラベル
  Color? get color {
    if (this == null) {
      return null;
    }
    return this!.color;
  }
}
