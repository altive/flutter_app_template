// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'my_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUserModel _$$_AppUserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AppUserModel',
      json,
      ($checkedConvert) {
        final val = _$_AppUserModel(
          createdAt: $checkedConvert('createdAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          nickname: $checkedConvert('nickname', (v) => v as String?),
          stockCategories: $checkedConvert('stockPlaces',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'stockCategories': 'stockPlaces'},
    );

Map<String, dynamic> _$$_AppUserModelToJson(_$_AppUserModel instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'nickname': instance.nickname,
      'stockPlaces': instance.stockCategories,
    };
