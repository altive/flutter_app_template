// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ranking _$$_RankingFromJson(Map<String, dynamic> json) => _$_Ranking(
      createdAt: const TimestampOrNullConverter()
          .fromJson(json['created_at'] as Timestamp?),
      updatedAt: const TimestampOrNullConverter()
          .fromJson(json['updated_at'] as Timestamp?),
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      pinned: json['pinned'] as bool? ?? false,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      recommendTagsShowing: json['recommend_tags_showing'] as bool? ?? true,
    );

Map<String, dynamic> _$$_RankingToJson(_$_Ranking instance) =>
    <String, dynamic>{
      'created_at': const TimestampOrNullConverter().toJson(instance.createdAt),
      'updated_at': const TimestampOrNullConverter().toJson(instance.updatedAt),
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'pinned': instance.pinned,
      'tags': instance.tags,
      'recommend_tags_showing': instance.recommendTagsShowing,
    };
