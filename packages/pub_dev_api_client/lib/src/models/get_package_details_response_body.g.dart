// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_package_details_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPackageDetailsResponseBodyImpl
    _$$GetPackageDetailsResponseBodyImplFromJson(Map<String, dynamic> json) =>
        _$GetPackageDetailsResponseBodyImpl(
          name: json['name'] as String,
          latest: LatestPackageRelease.fromJson(
              json['latest'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$GetPackageDetailsResponseBodyImplToJson(
        _$GetPackageDetailsResponseBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latest': instance.latest,
    };
