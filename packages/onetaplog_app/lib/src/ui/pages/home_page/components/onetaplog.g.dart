// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'onetaplog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OTLog _$$_OTLogFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_OTLog',
      json,
      ($checkedConvert) {
        final val = _$_OTLog(
          title: $checkedConvert('title', (v) => v as String),
          iconData: $checkedConvert(
              'iconData', (v) => iconDataConverter.fromJson(v as int)),
          color: $checkedConvert(
              'color', (v) => colorConverter.fromJson(v as int)),
          lastUpdatedAt: $checkedConvert(
              'lastUpdatedAt', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_OTLogToJson(_$_OTLog instance) => <String, dynamic>{
      'title': instance.title,
      'iconData': iconDataConverter.toJson(instance.iconData),
      'color': colorConverter.toJson(instance.color),
      'lastUpdatedAt': instance.lastUpdatedAt.toIso8601String(),
    };
