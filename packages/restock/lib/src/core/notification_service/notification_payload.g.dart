// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPayload _$_$_NotificationPayloadFromJson(Map json) {
  return _$_NotificationPayload(
    documentId: json['documentId'] as String,
    itemName: json['itemName'] as String,
    expirationDate: DateTime.parse(json['expirationDate'] as String),
    notificationDurationDays: json['notificationDurationDays'] as int,
    hour: json['hour'] as int,
    minute: json['minute'] as int,
  );
}

Map<String, dynamic> _$_$_NotificationPayloadToJson(
        _$_NotificationPayload instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'itemName': instance.itemName,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'notificationDurationDays': instance.notificationDurationDays,
      'hour': instance.hour,
      'minute': instance.minute,
    };
