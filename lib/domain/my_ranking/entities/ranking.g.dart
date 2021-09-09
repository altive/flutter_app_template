// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ranking _$_$_RankingFromJson(Map<String, dynamic> json) {
  return _$_Ranking(
    createdAt: const TimestampOrNullConverter()
        .fromJson(json['created_at'] as Timestamp?),
    updatedAt: const TimestampOrNullConverter()
        .fromJson(json['updated_at'] as Timestamp?),
    userId: json['user_id'] as String,
    title: json['title'] as String? ?? '',
    comment: json['comment'] as String? ?? '',
    imageUrl: json['image_url'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
    pinned: json['pinned'] as bool? ?? false,
    orders:
        (json['orders'] as List<dynamic>?)?.map((e) => e as String).toList() ??
            [],
  );
}

Map<String, dynamic> _$_$_RankingToJson(_$_Ranking instance) =>
    <String, dynamic>{
      'created_at': const TimestampOrNullConverter().toJson(instance.createdAt),
      'updated_at': const TimestampOrNullConverter().toJson(instance.updatedAt),
      'user_id': instance.userId,
      'title': instance.title,
      'comment': instance.comment,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'pinned': instance.pinned,
      'orders': instance.orders,
    };
