// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavoriteItem _$$_FavoriteItemFromJson(Map json) => _$_FavoriteItem(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      name: json['name'] as String,
      asin: json['asin'] as String?,
      category: json['category'] as String,
      expirationDateTypeInt: json['expirationDateTypeInt'] as int,
      expirationAt: const TimestampConverter()
          .fromJson(json['expirationAt'] as Timestamp?),
      amazonUrl: json['amazonUrl'] as String?,
      imageUrlSmall: json['imageUrlSmall'] as String?,
      imageUrlMedium: json['imageUrlMedium'] as String?,
      imageUrlLarge: json['imageUrlLarge'] as String?,
    );

Map<String, dynamic> _$$_FavoriteItemToJson(_$_FavoriteItem instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'name': instance.name,
      'asin': instance.asin,
      'category': instance.category,
      'expirationDateTypeInt': instance.expirationDateTypeInt,
      'expirationAt': const TimestampConverter().toJson(instance.expirationAt),
      'amazonUrl': instance.amazonUrl,
      'imageUrlSmall': instance.imageUrlSmall,
      'imageUrlMedium': instance.imageUrlMedium,
      'imageUrlLarge': instance.imageUrlLarge,
    };
