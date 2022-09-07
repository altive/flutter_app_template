// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ranking _$RankingFromJson(Map<String, dynamic> json) {
  return _Ranking.fromJson(json);
}

/// @nodoc
mixin _$Ranking {
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// ランキングタイトル
  String get title => throw _privateConstructorUsedError;

  /// ランキングの説明
  String get description => throw _privateConstructorUsedError;

  /// ランキングの画像
  String? get imageUrl => throw _privateConstructorUsedError;

  /// ランキングのサムネイル画像
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// 優先して表示させたいランキングなら `true`
  bool get pinned => throw _privateConstructorUsedError;

  /// タグリスト
  List<String> get tags => throw _privateConstructorUsedError;

  /// お勧めタグを表示するか
  bool get recommendTagsShowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankingCopyWith<Ranking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingCopyWith<$Res> {
  factory $RankingCopyWith(Ranking value, $Res Function(Ranking) then) =
      _$RankingCopyWithImpl<$Res>;
  $Res call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned,
      List<String> tags,
      bool recommendTagsShowing});
}

/// @nodoc
class _$RankingCopyWithImpl<$Res> implements $RankingCopyWith<$Res> {
  _$RankingCopyWithImpl(this._value, this._then);

  final Ranking _value;
  // ignore: unused_field
  final $Res Function(Ranking) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? pinned = freezed,
    Object? tags = freezed,
    Object? recommendTagsShowing = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendTagsShowing: recommendTagsShowing == freezed
          ? _value.recommendTagsShowing
          : recommendTagsShowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RankingCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$$_RankingCopyWith(
          _$_Ranking value, $Res Function(_$_Ranking) then) =
      __$$_RankingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned,
      List<String> tags,
      bool recommendTagsShowing});
}

/// @nodoc
class __$$_RankingCopyWithImpl<$Res> extends _$RankingCopyWithImpl<$Res>
    implements _$$_RankingCopyWith<$Res> {
  __$$_RankingCopyWithImpl(_$_Ranking _value, $Res Function(_$_Ranking) _then)
      : super(_value, (v) => _then(v as _$_Ranking));

  @override
  _$_Ranking get _value => super._value as _$_Ranking;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? pinned = freezed,
    Object? tags = freezed,
    Object? recommendTagsShowing = freezed,
  }) {
    return _then(_$_Ranking(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: pinned == freezed
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recommendTagsShowing: recommendTagsShowing == freezed
          ? _value.recommendTagsShowing
          : recommendTagsShowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ranking extends _Ranking with DiagnosticableTreeMixin {
  const _$_Ranking(
      {@TimestampOrNullConverter() this.createdAt,
      @TimestampOrNullConverter() this.updatedAt,
      this.title = '',
      this.description = '',
      this.imageUrl,
      this.thumbnailUrl,
      this.pinned = false,
      final List<String> tags = const <String>[],
      this.recommendTagsShowing = true})
      : _tags = tags,
        super._();

  factory _$_Ranking.fromJson(Map<String, dynamic> json) =>
      _$$_RankingFromJson(json);

  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;
  @override
  @TimestampOrNullConverter()
  final DateTime? updatedAt;

  /// ランキングタイトル
  @override
  @JsonKey()
  final String title;

  /// ランキングの説明
  @override
  @JsonKey()
  final String description;

  /// ランキングの画像
  @override
  final String? imageUrl;

  /// ランキングのサムネイル画像
  @override
  final String? thumbnailUrl;

  /// 優先して表示させたいランキングなら `true`
  @override
  @JsonKey()
  final bool pinned;

  /// タグリスト
  final List<String> _tags;

  /// タグリスト
  @override
  @JsonKey()
  List<String> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  /// お勧めタグを表示するか
  @override
  @JsonKey()
  final bool recommendTagsShowing;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ranking(createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, pinned: $pinned, tags: $tags, recommendTagsShowing: $recommendTagsShowing)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ranking'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))
      ..add(DiagnosticsProperty('pinned', pinned))
      ..add(DiagnosticsProperty('tags', tags))
      ..add(DiagnosticsProperty('recommendTagsShowing', recommendTagsShowing));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ranking &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl) &&
            const DeepCollectionEquality().equals(other.pinned, pinned) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other.recommendTagsShowing, recommendTagsShowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(thumbnailUrl),
      const DeepCollectionEquality().hash(pinned),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(recommendTagsShowing));

  @JsonKey(ignore: true)
  @override
  _$$_RankingCopyWith<_$_Ranking> get copyWith =>
      __$$_RankingCopyWithImpl<_$_Ranking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingToJson(this);
  }
}

abstract class _Ranking extends Ranking {
  const factory _Ranking(
      {@TimestampOrNullConverter() final DateTime? createdAt,
      @TimestampOrNullConverter() final DateTime? updatedAt,
      final String title,
      final String description,
      final String? imageUrl,
      final String? thumbnailUrl,
      final bool pinned,
      final List<String> tags,
      final bool recommendTagsShowing}) = _$_Ranking;
  const _Ranking._() : super._();

  factory _Ranking.fromJson(Map<String, dynamic> json) = _$_Ranking.fromJson;

  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampOrNullConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override

  /// ランキングタイトル
  String get title => throw _privateConstructorUsedError;
  @override

  /// ランキングの説明
  String get description => throw _privateConstructorUsedError;
  @override

  /// ランキングの画像
  String? get imageUrl => throw _privateConstructorUsedError;
  @override

  /// ランキングのサムネイル画像
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @override

  /// 優先して表示させたいランキングなら `true`
  bool get pinned => throw _privateConstructorUsedError;
  @override

  /// タグリスト
  List<String> get tags => throw _privateConstructorUsedError;
  @override

  /// お勧めタグを表示するか
  bool get recommendTagsShowing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RankingCopyWith<_$_Ranking> get copyWith =>
      throw _privateConstructorUsedError;
}
