import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/date_time_timestamp_converter.dart';

part 'stock_item.freezed.dart';
part 'stock_item.g.dart';

/// 備蓄アイテムのデータ。
@freezed
sealed class StockItem with _$StockItem {
  const factory StockItem({
    required String id,
    required String name,
    required String originalName,
    required String category,
    required String place,
    required int numberOfItems,
    required int idNumber,
    required int expirationDateTypeInt,
    String? amazonUrl,
    String? asin,
    String? itemId,
    String? memo,
    String? imagePathLarge,
    String? imagePathMedium,
    String? imagePathOriginal,
    String? imagePathSmall,
    String? imageUrlLarge,
    String? imageUrlMedium,
    String? imageUrlSmall,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    @DateTimeTimestampConverter() DateTime? expirationAt,
  }) = _StockItem;

  const StockItem._();

  factory StockItem.fromJson(Map<String, Object?> json) =>
      _$StockItemFromJson(json);

  static String collectionPath({required String userId}) =>
      'users/$userId/stockItems';

  static String docPath({
    required String userId,
    required String stockItemId,
  }) => '${collectionPath(userId: userId)}/$stockItemId';

  static StockItem? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return data == null ? null : StockItem.fromJson(data);
  }

  static Map<String, Object?> toFirestore(
    StockItem? stockItem,
    SetOptions? options,
  ) {
    if (stockItem == null) {
      return {};
    }
    final json = stockItem.toJson();
    final createdAt = json['createdAt'];
    if (createdAt == null) {
      json['createdAt'] = FieldValue.serverTimestamp();
    }
    json['updatedAt'] = FieldValue.serverTimestamp();
    return json;
  }
}
