import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/stock/stock_entity.dart';
import 'stock_editor_mode.dart';

part 'stock_editor_parameter.freezed.dart';

@freezed
class StockEditorParameter with _$StockEditorParameter {
  const factory StockEditorParameter({
    /// @nullable
    StockEditorMode? mode,

    /// @nullable
    StockEntity? stock,

    /// @nullable
    File? imageFile,
  }) = _StockEditorParameter;

  /// Amazon商品から作成用のコンストラクタ
  factory StockEditorParameter.createrWithAmazon({
    required StockEntity stock,
  }) =>
      StockEditorParameter(
        mode: StockEditorMode.creationWithAmazon,
        stock: stock,
      );

  /// 写真から作成用のコンストラクタ
  factory StockEditorParameter.createrWithPhoto({
    required File imageFile,
  }) =>
      StockEditorParameter(
        mode: StockEditorMode.creationWithPhoto,
        imageFile: imageFile,
      );

  /// 既存ストック更新用のコンストラクタ
  factory StockEditorParameter.updater({
    required StockEntity stock,
  }) =>
      StockEditorParameter(
        mode: StockEditorMode.update,
        stock: stock,
      );

  /// 複製用のコンストラクタ
  factory StockEditorParameter.duplicater({
    required StockEntity stock,
  }) =>
      StockEditorParameter(
        mode: StockEditorMode.duplicate,
        stock: stock,
      );
}
