// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPayload _$$_NotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_NotificationPayload',
      json,
      ($checkedConvert) {
        final val = _$_NotificationPayload(
          documentId: $checkedConvert('documentId', (v) => v as String),
          itemName: $checkedConvert('itemName', (v) => v as String),
          expirationDate: $checkedConvert(
              'expirationDate', (v) => DateTime.parse(v as String)),
          notificationDurationDays:
              $checkedConvert('notificationDurationDays', (v) => v as int),
          hour: $checkedConvert('hour', (v) => v as int),
          minute: $checkedConvert('minute', (v) => v as int),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_NotificationPayloadToJson(
        _$_NotificationPayload instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'itemName': instance.itemName,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'notificationDurationDays': instance.notificationDurationDays,
      'hour': instance.hour,
      'minute': instance.minute,
    };
