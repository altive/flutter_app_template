// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'me_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MeEntity _$$_MeEntityFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_MeEntity',
      json,
      ($checkedConvert) {
        final val = _$_MeEntity(
          createdAt: $checkedConvert('createdAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          groups: $checkedConvert('stockPlaces',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          isPrivateMyStock:
              $checkedConvert('isPrivateMyStock', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'groups': 'stockPlaces'},
    );

Map<String, dynamic> _$$_MeEntityToJson(_$_MeEntity instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'nickname': instance.nickname,
      'stockPlaces': instance.groups,
      'isPrivateMyStock': instance.isPrivateMyStock,
    };
