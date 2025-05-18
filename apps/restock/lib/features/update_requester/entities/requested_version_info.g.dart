// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'requested_version_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestedVersionInfoImpl _$$RequestedVersionInfoImplFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(r'_$RequestedVersionInfoImpl', json, ($checkedConvert) {
  final val = _$RequestedVersionInfoImpl(
    requiredVersion: $checkedConvert('requiredVersion', (v) => v as String),
    canCancel: $checkedConvert('canCancel', (v) => v as bool? ?? false),
    enabledAt: $checkedConvert('enabledAt', (v) => DateTime.parse(v as String)),
  );
  return val;
});

Map<String, dynamic> _$$RequestedVersionInfoImplToJson(
  _$RequestedVersionInfoImpl instance,
) => <String, dynamic>{
  'requiredVersion': instance.requiredVersion,
  'canCancel': instance.canCancel,
  'enabledAt': instance.enabledAt.toIso8601String(),
};
