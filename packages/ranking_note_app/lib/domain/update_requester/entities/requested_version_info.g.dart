// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requested_version_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestedVersionInfo _$$_RequestedVersionInfoFromJson(
        Map<String, dynamic> json) =>
    _$_RequestedVersionInfo(
      requiredVersion: json['required_version'] as String,
      canCancel: json['can_cancel'] as bool? ?? false,
      enabledAt: DateTime.parse(json['enabled_at'] as String),
    );

Map<String, dynamic> _$$_RequestedVersionInfoToJson(
        _$_RequestedVersionInfo instance) =>
    <String, dynamic>{
      'required_version': instance.requiredVersion,
      'can_cancel': instance.canCancel,
      'enabled_at': instance.enabledAt.toIso8601String(),
    };
