// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$UserImpl', json, ($checkedConvert) {
  final val = _$UserImpl(
    id: $checkedConvert('id', (v) => v as String),
    email: $checkedConvert('email', (v) => v as String),
    displayName: $checkedConvert('displayName', (v) => v as String),
    photoUrl: $checkedConvert('photoUrl', (v) => v as String?),
    createdAt: $checkedConvert('createdAt', (v) => DateTime.parse(v as String)),
    updatedAt: $checkedConvert('updatedAt', (v) => DateTime.parse(v as String)),
    isPremium: $checkedConvert('isPremium', (v) => v as bool? ?? false),
    preferences: $checkedConvert(
      'preferences',
      (v) => v as Map<String, dynamic>? ?? const {},
    ),
  );
  return val;
});

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'isPremium': instance.isPremium,
      'preferences': instance.preferences,
    };
