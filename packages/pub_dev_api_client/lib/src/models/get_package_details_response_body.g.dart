// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_package_details_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPackageDetailsResponseBody _$GetPackageDetailsResponseBodyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetPackageDetailsResponseBody', json, ($checkedConvert) {
  final val = GetPackageDetailsResponseBody(
    name: $checkedConvert('name', (v) => v as String),
    latest: $checkedConvert(
      'latest',
      (v) => LatestPackageRelease.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$GetPackageDetailsResponseBodyToJson(
  GetPackageDetailsResponseBody instance,
) => <String, dynamic>{
  'name': instance.name,
  'latest': instance.latest.toJson(),
};
