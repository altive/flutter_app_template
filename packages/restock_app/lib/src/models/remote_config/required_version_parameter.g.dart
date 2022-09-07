// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'required_version_parameter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequiredVersion _$RequiredVersionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RequiredVersion',
      json,
      ($checkedConvert) {
        final val = RequiredVersion(
          requiredBuildNumber:
              $checkedConvert('requiredBuildNumber', (v) => v as int),
          canCancel: $checkedConvert('canCancel', (v) => v as bool),
          enabledAt:
              $checkedConvert('enabledAt', (v) => DateTime.parse(v as String)),
          isEnabled: $checkedConvert('isEnabled', (v) => v as bool),
        );
        return val;
      },
    );

Map<String, dynamic> _$RequiredVersionToJson(RequiredVersion instance) =>
    <String, dynamic>{
      'requiredBuildNumber': instance.requiredBuildNumber,
      'enabledAt': instance.enabledAt.toIso8601String(),
      'isEnabled': instance.isEnabled,
      'canCancel': instance.canCancel,
    };
