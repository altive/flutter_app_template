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
  DateTime? get createdAt => throw _privateConstructorUsedError;
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
      {DateTime? createdAt,
      DateTime? updatedAt,
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
      {DateTime? createdAt,
      DateTime? updatedAt,
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

@allJsonConvertersSerializable
class _$_Ranking extends _Ranking {
  const _$_Ranking(
      {this.createdAt,
      this.updatedAt,
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
  final DateTime? createdAt;
  @override
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
  String toString() {
    return 'Ranking(createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, pinned: $pinned, tags: $tags, recommendTagsShowing: $recommendTagsShowing)';
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
    return _$$_RankingToJson(
      this,
    );
  }
}

abstract class _Ranking extends Ranking {
  const factory _Ranking(
      {final DateTime? createdAt,
      final DateTime? updatedAt,
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
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override

  /// ランキングタイトル
  String get title;
  @override

  /// ランキングの説明
  String get description;
  @override

  /// ランキングの画像
  String? get imageUrl;
  @override

  /// ランキングのサムネイル画像
  String? get thumbnailUrl;
  @override

  /// 優先して表示させたいランキングなら `true`
  bool get pinned;
  @override

  /// タグリスト
  List<String> get tags;
  @override

  /// お勧めタグを表示するか
  bool get recommendTagsShowing;
  @override
  @JsonKey(ignore: true)
  _$$_RankingCopyWith<_$_Ranking> get copyWith =>
      throw _privateConstructorUsedError;
}

RankingMember _$RankingMemberFromJson(Map<String, dynamic> json) {
  return _RankingMember.fromJson(json);
}

/// @nodoc
mixin _$RankingMember {
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 順番
  double get order => throw _privateConstructorUsedError;

  /// 項目名
  String get title => throw _privateConstructorUsedError;

  /// 項目に対するコメント
  String get description => throw _privateConstructorUsedError;

  /// 項目の画像
  String? get imageUrl => throw _privateConstructorUsedError;

  /// 項目のサムネイル画像
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RankingMemberCopyWith<RankingMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingMemberCopyWith<$Res> {
  factory $RankingMemberCopyWith(
          RankingMember value, $Res Function(RankingMember) then) =
      _$RankingMemberCopyWithImpl<$Res>;
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      double order,
      String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl});
}

/// @nodoc
class _$RankingMemberCopyWithImpl<$Res>
    implements $RankingMemberCopyWith<$Res> {
  _$RankingMemberCopyWithImpl(this._value, this._then);

  final RankingMember _value;
  // ignore: unused_field
  final $Res Function(RankingMember) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? order = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
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
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as double,
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
    ));
  }
}

/// @nodoc
abstract class _$$_RankingMemberCopyWith<$Res>
    implements $RankingMemberCopyWith<$Res> {
  factory _$$_RankingMemberCopyWith(
          _$_RankingMember value, $Res Function(_$_RankingMember) then) =
      __$$_RankingMemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? createdAt,
      DateTime? updatedAt,
      double order,
      String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl});
}

/// @nodoc
class __$$_RankingMemberCopyWithImpl<$Res>
    extends _$RankingMemberCopyWithImpl<$Res>
    implements _$$_RankingMemberCopyWith<$Res> {
  __$$_RankingMemberCopyWithImpl(
      _$_RankingMember _value, $Res Function(_$_RankingMember) _then)
      : super(_value, (v) => _then(v as _$_RankingMember));

  @override
  _$_RankingMember get _value => super._value as _$_RankingMember;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? order = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_$_RankingMember(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as double,
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
    ));
  }
}

/// @nodoc

@allJsonConvertersSerializable
class _$_RankingMember extends _RankingMember {
  const _$_RankingMember(
      {this.createdAt,
      this.updatedAt,
      required this.order,
      required this.title,
      this.description = '',
      this.imageUrl,
      this.thumbnailUrl})
      : super._();

  factory _$_RankingMember.fromJson(Map<String, dynamic> json) =>
      _$$_RankingMemberFromJson(json);

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// 順番
  @override
  final double order;

  /// 項目名
  @override
  final String title;

  /// 項目に対するコメント
  @override
  @JsonKey()
  final String description;

  /// 項目の画像
  @override
  final String? imageUrl;

  /// 項目のサムネイル画像
  @override
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'RankingMember(createdAt: $createdAt, updatedAt: $updatedAt, order: $order, title: $title, description: $description, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RankingMember &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(thumbnailUrl));

  @JsonKey(ignore: true)
  @override
  _$$_RankingMemberCopyWith<_$_RankingMember> get copyWith =>
      __$$_RankingMemberCopyWithImpl<_$_RankingMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingMemberToJson(
      this,
    );
  }
}

abstract class _RankingMember extends RankingMember {
  const factory _RankingMember(
      {final DateTime? createdAt,
      final DateTime? updatedAt,
      required final double order,
      required final String title,
      final String description,
      final String? imageUrl,
      final String? thumbnailUrl}) = _$_RankingMember;
  const _RankingMember._() : super._();

  factory _RankingMember.fromJson(Map<String, dynamic> json) =
      _$_RankingMember.fromJson;

  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override

  /// 順番
  double get order;
  @override

  /// 項目名
  String get title;
  @override

  /// 項目に対するコメント
  String get description;
  @override

  /// 項目の画像
  String? get imageUrl;
  @override

  /// 項目のサムネイル画像
  String? get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$$_RankingMemberCopyWith<_$_RankingMember> get copyWith =>
      throw _privateConstructorUsedError;
}
