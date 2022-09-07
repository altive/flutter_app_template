// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequest _$$_UserRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_UserRequest',
      json,
      ($checkedConvert) {
        final val = _$_UserRequest(
          createdAt: $checkedConvert('createdAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => const TimestampConverter().fromJson(v as Timestamp?)),
          uid: $checkedConvert('uid', (v) => v as String),
          deviceName: $checkedConvert('deviceName', (v) => v as String?),
          deviceOS: $checkedConvert('deviceOS', (v) => v as String?),
          appName: $checkedConvert('appName', (v) => v as String),
          packageName: $checkedConvert('packageName', (v) => v as String?),
          version: $checkedConvert('version', (v) => v as String),
          buildNumber: $checkedConvert('buildNumber', (v) => v as String),
          replyFor: $checkedConvert('replyFor', (v) => v as String),
          text: $checkedConvert('text', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_UserRequestToJson(_$_UserRequest instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'uid': instance.uid,
      'deviceName': instance.deviceName,
      'deviceOS': instance.deviceOS,
      'appName': instance.appName,
      'packageName': instance.packageName,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
      'replyFor': instance.replyFor,
      'text': instance.text,
    };
