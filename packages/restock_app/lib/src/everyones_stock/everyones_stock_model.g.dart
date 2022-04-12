// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyones_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EveryonesStockModel _$$_EveryonesStockModelFromJson(Map json) =>
    _$_EveryonesStockModel(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      name: json['name'] as String,
      numberOfItems: (json['numberOfItems'] as num).toDouble(),
      asin: json['asin'] as String,
      category: json['category'] as String,
      expirationDateTypeInt: json['expirationDateTypeInt'] as int,
      expirationAt: const TimestampConverter()
          .fromJson(json['expirationAt'] as Timestamp?),
      amazonUrl: json['amazonUrl'] as String,
      imageUrlSmall: json['imageUrlSmall'] as String?,
      imageUrlMedium: json['imageUrlMedium'] as String?,
      imageUrlLarge: json['imageUrlLarge'] as String?,
      nickname: json['nickname'] as String,
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
