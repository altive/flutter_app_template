import 'package:freezed_annotation/freezed_annotation.dart';

import '../../everyones_stock/expiration_date_type.dart';
import '../../my_stock/my_stock_category.dart';

part 'stock_editor_state.freezed.dart';

@freezed
class StockEditorState with _$StockEditorState {
  const factory StockEditorState({
    // 編集されたかどうか
    @Default(false) bool hasChanged,
    // 読み込み中かどうか
    @Default(false) bool loading,
    // アイテムの名前
    @Default('') String itemName,
    // アイテムの個数
    @Default(1) int numberOfItems,
    // 期限の種類
    @Default(ExpirationDateType.bestBefore)
        ExpirationDateType expirationDateType,
    // 期限の日付
    DateTime? expirationDate,
    // アマゾンの商品URL@nullable
    String? amazonUrl,
    // 商品画像（大）
    String? imageUrl,
    // アイテムのジャンル
    @JsonKey(name: 'category')
    @Default(MyStockCategory.grocery)
        MyStockCategory productCategory,
    // メモ@nullable
    String? memo,
    // 通知するか
    @Default(false) bool isNotificationEnabled,
    // グループ@nullable
    @JsonKey(name: 'place') String? stockCategory,
  }) = _StockEditorState;
}
