// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_pubspec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackagePubspec _$PackagePubspecFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PackagePubspec', json, ($checkedConvert) {
      final val = _PackagePubspec(
        name: $checkedConvert('name', (v) => v as String),
        version: $checkedConvert('version', (v) => v as String),
        description: $checkedConvert('description', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$PackagePubspecToJson(_PackagePubspec instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
    };
