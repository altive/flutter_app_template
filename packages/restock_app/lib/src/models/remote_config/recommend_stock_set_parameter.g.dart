// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'recommend_stock_set_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendStockSet _$RecommendStockSetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RecommendStockSet',
      json,
      ($checkedConvert) {
        final val = RecommendStockSet(
          createdAt: $checkedConvert('createdAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => v == null ? null : DateTime.parse(v as String)),
          title: $checkedConvert('title', (v) => v as String),
          subtitle: $checkedConvert('subtitle', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          iconName: $checkedConvert('iconName', (v) => v as String),
          itemList: $checkedConvert(
              'itemList',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      RecommendStockSetItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
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

RecommendStockSetItem _$RecommendStockSetItemFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'RecommendStockSetItem',
      json,
      ($checkedConvert) {
        final val = RecommendStockSetItem(
          asin: $checkedConvert('asin', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$RecommendStockSetItemToJson(
        RecommendStockSetItem instance) =>
    <String, dynamic>{
      'asin': instance.asin,
      'description': instance.description,
    };
