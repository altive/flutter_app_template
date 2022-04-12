// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MeEntity _$$_MeEntityFromJson(Map json) => _$_MeEntity(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      nickname: json['nickname'] as String?,
      groups: (json['stockPlaces'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPrivateMyStock: json['isPrivateMyStock'] as bool?,
    );

Map<String, dynamic> _$$_MeEntityToJson(_$_MeEntity instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'nickname': instance.nickname,
      'stockPlaces': instance.groups,
      'isPrivateMyStock': instance.isPrivateMyStock,
    };
