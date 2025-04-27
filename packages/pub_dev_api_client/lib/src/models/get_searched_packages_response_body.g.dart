// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_searched_packages_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetSearchedPackagesResponseBody _$GetSearchedPackagesResponseBodyFromJson(
  Map<String, dynamic> json,
) => _GetSearchedPackagesResponseBody(
  packages:
      (json['packages'] as List<dynamic>)
          .map((e) => PackageName.fromJson(e as Map<String, dynamic>))
          .toList(),
  nextPageUrl: json['next'] as String?,
);

Map<String, dynamic> _$GetSearchedPackagesResponseBodyToJson(
  _GetSearchedPackagesResponseBody instance,
) => <String, dynamic>{
  'packages': instance.packages,
  'next': instance.nextPageUrl,
};
