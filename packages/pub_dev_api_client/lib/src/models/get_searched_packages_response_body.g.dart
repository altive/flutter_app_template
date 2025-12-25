// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_searched_packages_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSearchedPackagesResponseBody _$GetSearchedPackagesResponseBodyFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetSearchedPackagesResponseBody', json, ($checkedConvert) {
  final val = GetSearchedPackagesResponseBody(
    packages: $checkedConvert(
      'packages',
      (v) => (v as List<dynamic>)
          .map((e) => PackageName.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    nextPageUrl: $checkedConvert('next', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'nextPageUrl': 'next'});

Map<String, dynamic> _$GetSearchedPackagesResponseBodyToJson(
  GetSearchedPackagesResponseBody instance,
) => <String, dynamic>{
  'packages': instance.packages.map((e) => e.toJson()).toList(),
  'next': instance.nextPageUrl,
};
