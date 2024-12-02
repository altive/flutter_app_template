// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_package_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPackageResponseBodyImpl _$$GetPackageResponseBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPackageResponseBodyImpl(
      name: json['name'] as String,
      latest:
          LatestPackageRelease.fromJson(json['latest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetPackageResponseBodyImplToJson(
        _$GetPackageResponseBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latest': instance.latest,
    };
