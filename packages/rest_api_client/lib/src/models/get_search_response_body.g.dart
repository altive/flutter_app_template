// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_search_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSearchResponseBodyImpl _$$GetSearchResponseBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSearchResponseBodyImpl(
      packages: (json['packages'] as List<dynamic>)
          .map((e) => PackageName.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next'] as String?,
    );

Map<String, dynamic> _$$GetSearchResponseBodyImplToJson(
        _$GetSearchResponseBodyImpl instance) =>
    <String, dynamic>{
      'packages': instance.packages,
      'next': instance.nextPageUrl,
    };
