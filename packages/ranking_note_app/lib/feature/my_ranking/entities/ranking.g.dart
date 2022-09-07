// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'ranking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ranking _$$_RankingFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Ranking',
      json,
      ($checkedConvert) {
        final val = _$_Ranking(
          createdAt: $checkedConvert(
              'created_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          updatedAt: $checkedConvert(
              'updated_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          description:
              $checkedConvert('description', (v) => v as String? ?? ''),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
          thumbnailUrl: $checkedConvert('thumbnail_url', (v) => v as String?),
          pinned: $checkedConvert('pinned', (v) => v as bool? ?? false),
          tags: $checkedConvert(
              'tags',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const <String>[]),
          recommendTagsShowing: $checkedConvert(
              'recommend_tags_showing', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'imageUrl': 'image_url',
        'thumbnailUrl': 'thumbnail_url',
        'recommendTagsShowing': 'recommend_tags_showing'
      },
    );

Map<String, dynamic> _$$_RankingToJson(_$_Ranking instance) =>
    <String, dynamic>{
      'created_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'updated_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'pinned': instance.pinned,
      'tags': instance.tags,
      'recommend_tags_showing': instance.recommendTagsShowing,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
