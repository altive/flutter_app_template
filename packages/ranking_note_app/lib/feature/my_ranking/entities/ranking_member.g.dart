// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'ranking_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RankingMember _$$_RankingMemberFromJson(Map<String, dynamic> json) =>
    _$_RankingMember(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      order: (json['order'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$_RankingMemberToJson(_$_RankingMember instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'order': instance.order,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
