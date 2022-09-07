// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'everyones_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EveryonesStockModel _$$_EveryonesStockModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_EveryonesStockModel',
      json,
      ($checkedConvert) {
        final val = _$_EveryonesStockModel(
          createdAt: $checkedConvert('createdAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          name: $checkedConvert('name', (v) => v as String),
          numberOfItems:
              $checkedConvert('numberOfItems', (v) => (v as num).toDouble()),
          asin: $checkedConvert('asin', (v) => v as String),
          category: $checkedConvert('category', (v) => v as String),
          expirationDateTypeInt:
              $checkedConvert('expirationDateTypeInt', (v) => v as int),
          expirationAt: $checkedConvert('expirationAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          amazonUrl: $checkedConvert('amazonUrl', (v) => v as String),
          imageUrlSmall: $checkedConvert('imageUrlSmall', (v) => v as String?),
          imageUrlMedium:
              $checkedConvert('imageUrlMedium', (v) => v as String?),
          imageUrlLarge: $checkedConvert('imageUrlLarge', (v) => v as String?),
          nickname: $checkedConvert('nickname', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_EveryonesStockModelToJson(
        _$_EveryonesStockModel instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'name': instance.name,
      'numberOfItems': instance.numberOfItems,
      'asin': instance.asin,
      'category': instance.category,
      'expirationDateTypeInt': instance.expirationDateTypeInt,
      'expirationAt': const TimestampConverter().toJson(instance.expirationAt),
      'amazonUrl': instance.amazonUrl,
      'imageUrlSmall': instance.imageUrlSmall,
      'imageUrlMedium': instance.imageUrlMedium,
      'imageUrlLarge': instance.imageUrlLarge,
      'nickname': instance.nickname,
    };
