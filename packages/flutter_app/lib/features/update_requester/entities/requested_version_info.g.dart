// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'requested_version_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestedVersionInfoImpl _$$RequestedVersionInfoImplFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$RequestedVersionInfoImpl',
      json,
      ($checkedConvert) {
        final val = _$RequestedVersionInfoImpl(
          requiredVersion:
              $checkedConvert('required_version', (v) => v as String),
          canCancel: $checkedConvert('can_cancel', (v) => v as bool? ?? false),
          enabledAt:
              $checkedConvert('enabled_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'requiredVersion': 'required_version',
        'canCancel': 'can_cancel',
        'enabledAt': 'enabled_at'
      },
    );

Map<String, dynamic> _$$RequestedVersionInfoImplToJson(
        _$RequestedVersionInfoImpl instance) =>
    <String, dynamic>{
      'required_version': instance.requiredVersion,
      'can_cancel': instance.canCancel,
      'enabled_at': instance.enabledAt.toIso8601String(),
    };
