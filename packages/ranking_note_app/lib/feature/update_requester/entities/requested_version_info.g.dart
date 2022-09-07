// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'requested_version_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestedVersionInfo _$$_RequestedVersionInfoFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RequestedVersionInfo',
      json,
      ($checkedConvert) {
        final val = _$_RequestedVersionInfo(
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

Map<String, dynamic> _$$_RequestedVersionInfoToJson(
        _$_RequestedVersionInfo instance) =>
    <String, dynamic>{
      'required_version': instance.requiredVersion,
      'can_cancel': instance.canCancel,
      'enabled_at': instance.enabledAt.toIso8601String(),
    };
