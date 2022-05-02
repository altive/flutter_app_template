// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StockEntity _$$_StockEntityFromJson(Map json) => _$_StockEntity(
      id: json['id'] as String?,
      idNumber: json['idNumber'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      name: const StockNameConverter().fromJson(json['name'] as String),
      originalName: json['originalName'] as String?,
      numberOfItems: (json['numberOfItems'] as num).toDouble(),
      asin: json['asin'] as String?,
      itemId: json['itemId'] as String?,
      productCategory: json['category'] as String,
      expirationDateTypeInt: json['expirationDateTypeInt'] as int,
      expirationAt: const TimestampConverter()
          .fromJson(json['expirationAt'] as Timestamp?),
      amazonUrl: json['amazonUrl'] as String?,
      imageUrlSmall: json['imageUrlSmall'] as String?,
      imageUrlMedium: json['imageUrlMedium'] as String?,
      imageUrlLarge: json['imageUrlLarge'] as String?,
      imagePathSmall: json['imagePathSmall'] as String?,
      imagePathMedium: json['imagePathMedium'] as String?,
      imagePathLarge: json['imagePathLarge'] as String?,
      imagePathOriginal: json['imagePathOriginal'] as String?,
      memo: json['memo'] as String?,
      stockCategory: json['place'] as String?,
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
