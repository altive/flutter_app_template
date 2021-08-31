// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ranking _$_$_RankingFromJson(Map<String, dynamic> json) {
  return _$_Ranking(
    createdAt: const TimestampConverterOrNull()
        .fromJson(json['created_at'] as Timestamp?),
    updatedAt: const TimestampConverterOrNull()
        .fromJson(json['updated_at'] as Timestamp?),
    title: json['title'] as String? ?? '',
    comment: json['comment'] as String? ?? '',
    imageUrl: json['image_url'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
  );
}

Map<String, dynamic> _$_$_RankingToJson(_$_Ranking instance) =>
    <String, dynamic>{
      'created_at': const TimestampConverterOrNull().toJson(instance.createdAt),
      'updated_at': const TimestampConverterOrNull().toJson(instance.updatedAt),
      'title': instance.title,
      'comment': instance.comment,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
