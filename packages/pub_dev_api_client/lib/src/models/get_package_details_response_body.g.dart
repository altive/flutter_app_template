// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_package_details_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetPackageDetailsResponseBody _$GetPackageDetailsResponseBodyFromJson(
  Map<String, dynamic> json,
) => _GetPackageDetailsResponseBody(
  name: json['name'] as String,
  latest: LatestPackageRelease.fromJson(json['latest'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetPackageDetailsResponseBodyToJson(
  _GetPackageDetailsResponseBody instance,
) => <String, dynamic>{'name': instance.name, 'latest': instance.latest};
