// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageName _$PackageNameFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PackageName', json, ($checkedConvert) {
      final val = _PackageName(
        name: $checkedConvert('package', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'name': 'package'});

Map<String, dynamic> _$PackageNameToJson(_PackageName instance) =>
    <String, dynamic>{'package': instance.name};
