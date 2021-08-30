// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankingMember _$_$_RankingMemberFromJson(Map<String, dynamic> json) {
  return _$_RankingMember(
    createdAt:
        const TimestampConverter().fromJson(json['created_at'] as Timestamp),
    updatedAt:
        const TimestampConverter().fromJson(json['updated_at'] as Timestamp),
    ranking: json['ranking'] as int,
    title: json['title'] as String? ?? '',
    comment: json['comment'] as String? ?? '',
    imageUrl: json['image_url'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
  );
}

Map<String, dynamic> _$_$_RankingMemberToJson(_$_RankingMember instance) =>
    <String, dynamic>{
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'ranking': instance.ranking,
      'title': instance.title,
      'comment': instance.comment,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
