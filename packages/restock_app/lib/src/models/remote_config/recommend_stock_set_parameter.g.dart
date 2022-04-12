// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_stock_set_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendStockSet _$RecommendStockSetFromJson(Map json) => RecommendStockSet(
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      iconName: json['iconName'] as String,
      itemList: (json['itemList'] as List<dynamic>)
          .map((e) => RecommendStockSetItem.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$RecommendStockSetToJson(RecommendStockSet instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'iconName': instance.iconName,
      'itemList': instance.itemList.map((e) => e.toJson()).toList(),
    };

RecommendStockSetItem _$RecommendStockSetItemFromJson(Map json) =>
    RecommendStockSetItem(
      asin: json['asin'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RecommendStockSetItemToJson(
        RecommendStockSetItem instance) =>
    <String, dynamic>{
      'asin': instance.asin,
      'description': instance.description,
    };
