// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stock_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockItemImpl _$$StockItemImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$StockItemImpl', json, ($checkedConvert) {
  final val = _$StockItemImpl(
    id: $checkedConvert('id', (v) => v as String),
    name: $checkedConvert('name', (v) => v as String),
    originalName: $checkedConvert('originalName', (v) => v as String),
    category: $checkedConvert('category', (v) => v as String),
    place: $checkedConvert('place', (v) => v as String),
    numberOfItems: $checkedConvert('numberOfItems', (v) => (v as num).toInt()),
    idNumber: $checkedConvert('idNumber', (v) => (v as num).toInt()),
    expirationDateTypeInt: $checkedConvert(
      'expirationDateTypeInt',
      (v) => (v as num).toInt(),
    ),
    amazonUrl: $checkedConvert('amazonUrl', (v) => v as String?),
    asin: $checkedConvert('asin', (v) => v as String?),
    itemId: $checkedConvert('itemId', (v) => v as String?),
    memo: $checkedConvert('memo', (v) => v as String?),
    imagePathLarge: $checkedConvert('imagePathLarge', (v) => v as String?),
    imagePathMedium: $checkedConvert('imagePathMedium', (v) => v as String?),
    imagePathOriginal: $checkedConvert(
      'imagePathOriginal',
      (v) => v as String?,
    ),
    imagePathSmall: $checkedConvert('imagePathSmall', (v) => v as String?),
    imageUrlLarge: $checkedConvert('imageUrlLarge', (v) => v as String?),
    imageUrlMedium: $checkedConvert('imageUrlMedium', (v) => v as String?),
    imageUrlSmall: $checkedConvert('imageUrlSmall', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    expirationAt: $checkedConvert(
      'expirationAt',
      (v) => const DateTimeTimestampConverter().fromJson(v as Timestamp?),
    ),
  );
  return val;
});

Map<String, dynamic> _$$StockItemImplToJson(_$StockItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'originalName': instance.originalName,
      'category': instance.category,
      'place': instance.place,
      'numberOfItems': instance.numberOfItems,
      'idNumber': instance.idNumber,
      'expirationDateTypeInt': instance.expirationDateTypeInt,
      'amazonUrl': instance.amazonUrl,
      'asin': instance.asin,
      'itemId': instance.itemId,
      'memo': instance.memo,
      'imagePathLarge': instance.imagePathLarge,
      'imagePathMedium': instance.imagePathMedium,
      'imagePathOriginal': instance.imagePathOriginal,
      'imagePathSmall': instance.imagePathSmall,
      'imageUrlLarge': instance.imageUrlLarge,
      'imageUrlMedium': instance.imageUrlMedium,
      'imageUrlSmall': instance.imageUrlSmall,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'expirationAt': const DateTimeTimestampConverter().toJson(
        instance.expirationAt,
      ),
    };
