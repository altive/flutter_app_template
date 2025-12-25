// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageName _$PackageNameFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PackageName', json, ($checkedConvert) {
      final val = PackageName(
        name: $checkedConvert('package', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'name': 'package'});

Map<String, dynamic> _$PackageNameToJson(PackageName instance) =>
    <String, dynamic>{'package': instance.name};
