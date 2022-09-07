// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stock_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockEntity _$$_StockEntityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_StockEntity',
      json,
      ($checkedConvert) {
        final val = _$_StockEntity(
          id: $checkedConvert('id', (v) => v as String?),
          idNumber: $checkedConvert('idNumber', (v) => v as int),
          createdAt: $checkedConvert('createdAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          name: $checkedConvert(
              'name', (v) => const StockNameConverter().fromJson(v as String)),
          originalName: $checkedConvert('originalName', (v) => v as String?),
          numberOfItems:
              $checkedConvert('numberOfItems', (v) => (v as num).toDouble()),
          asin: $checkedConvert('asin', (v) => v as String?),
          itemId: $checkedConvert('itemId', (v) => v as String?),
          productCategory: $checkedConvert('category', (v) => v as String),
          expirationDateTypeInt:
              $checkedConvert('expirationDateTypeInt', (v) => v as int),
          expirationAt: $checkedConvert('expirationAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          amazonUrl: $checkedConvert('amazonUrl', (v) => v as String?),
          imageUrlSmall: $checkedConvert('imageUrlSmall', (v) => v as String?),
          imageUrlMedium:
              $checkedConvert('imageUrlMedium', (v) => v as String?),
          imageUrlLarge: $checkedConvert('imageUrlLarge', (v) => v as String?),
          imagePathSmall:
              $checkedConvert('imagePathSmall', (v) => v as String?),
          imagePathMedium:
              $checkedConvert('imagePathMedium', (v) => v as String?),
          imagePathLarge:
              $checkedConvert('imagePathLarge', (v) => v as String?),
          imagePathOriginal:
              $checkedConvert('imagePathOriginal', (v) => v as String?),
          memo: $checkedConvert('memo', (v) => v as String?),
          stockCategory: $checkedConvert('place', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'productCategory': 'category',
        'stockCategory': 'place'
      },
    );

Map<String, dynamic> _$$_StockEntityToJson(_$_StockEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idNumber': instance.idNumber,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'name': const StockNameConverter().toJson(instance.name),
      'originalName': instance.originalName,
      'numberOfItems': instance.numberOfItems,
      'asin': instance.asin,
      'itemId': instance.itemId,
      'category': instance.productCategory,
      'expirationDateTypeInt': instance.expirationDateTypeInt,
      'expirationAt': const TimestampConverter().toJson(instance.expirationAt),
      'amazonUrl': instance.amazonUrl,
      'imageUrlSmall': instance.imageUrlSmall,
      'imageUrlMedium': instance.imageUrlMedium,
      'imageUrlLarge': instance.imageUrlLarge,
      'imagePathSmall': instance.imagePathSmall,
      'imagePathMedium': instance.imagePathMedium,
      'imagePathLarge': instance.imagePathLarge,
      'imagePathOriginal': instance.imagePathOriginal,
      'memo': instance.memo,
      'place': instance.stockCategory,
    };
