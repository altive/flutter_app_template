import 'package:json_annotation/json_annotation.dart';

part 'recommend_stock_set_parameter.g.dart';

/// オススメ備蓄商品のASINリストfor検索エントランス画面
@JsonSerializable()
class RecommendStockSet {
  const RecommendStockSet({
    this.createdAt,
    this.updatedAt,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.iconName,
    required this.itemList,
  });

  factory RecommendStockSet.fromJson(Map<String, dynamic> json) =>
      _$RecommendStockSetFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendStockSetToJson(this);

  /// 追加日（新しいものにはラベル表示する）
  final DateTime? createdAt;

  /// 更新日（新しい更新があったものにはラベル表示をする）
  final DateTime? updatedAt;

  /// タイトル
  final String title;

  /// サブタイトル
  final String subtitle;

  /// 詳細説明
  final String description;

  /// アイコンの名前
  final String iconName;

  /// Amazon商品IDのリスト
  final List<RecommendStockSetItem> itemList;
}

@JsonSerializable()
class RecommendStockSetItem {
  const RecommendStockSetItem({
    required this.asin,
    required this.description,
  });

  factory RecommendStockSetItem.fromJson(Map<String, dynamic> json) =>
      _$RecommendStockSetItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendStockSetItemToJson(this);

  final String asin;
  final String description;
}
