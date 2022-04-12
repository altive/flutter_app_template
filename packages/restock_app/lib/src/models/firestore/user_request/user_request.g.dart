// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequest _$$_UserRequestFromJson(Map json) => _$_UserRequest(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      uid: json['uid'] as String,
      deviceName: json['deviceName'] as String?,
      deviceOS: json['deviceOS'] as String?,
      appName: json['appName'] as String,
      packageName: json['packageName'] as String?,
      version: json['version'] as String,
      buildNumber: json['buildNumber'] as String,
      replyFor: json['replyFor'] as String,
      text: json['text'] as String,
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
