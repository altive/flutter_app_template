// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankingMember _$_$_RankingMemberFromJson(Map<String, dynamic> json) {
  return _$_RankingMember(
    createdAt: const TimestampOrNullConverter()
        .fromJson(json['created_at'] as Timestamp?),
    updatedAt: const TimestampOrNullConverter()
        .fromJson(json['updated_at'] as Timestamp?),
    order: json['order'] as int,
    title: json['title'] as String,
    comment: json['comment'] as String? ?? '',
    imageUrl: json['image_url'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
  );
}

Map<String, dynamic> _$_$_RankingMemberToJson(_$_RankingMember instance) =>
    <String, dynamic>{
      'created_at': const TimestampOrNullConverter().toJson(instance.createdAt),
      'updated_at': const TimestampOrNullConverter().toJson(instance.updatedAt),
      'order': instance.order,
      'title': instance.title,
      'comment': instance.comment,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
