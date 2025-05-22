// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_searched_packages_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSearchedPackagesResponseBodyImpl
_$$GetSearchedPackagesResponseBodyImplFromJson(Map<String, dynamic> json) =>
    _$GetSearchedPackagesResponseBodyImpl(
      packages: (json['packages'] as List<dynamic>)
          .map((e) => PackageName.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next'] as String?,
    );

Map<String, dynamic> _$$GetSearchedPackagesResponseBodyImplToJson(
  _$GetSearchedPackagesResponseBodyImpl instance,
) => <String, dynamic>{
  'packages': instance.packages,
  'next': instance.nextPageUrl,
};
