// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ranking_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RankingMember _$RankingMemberFromJson(Map<String, dynamic> json) {
  return _RankingMember.fromJson(json);
}

/// @nodoc
class _$RankingMemberTearOff {
  const _$RankingMemberTearOff();

  _RankingMember call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      required double order,
      required String title,
      String description = '',
      String? imageUrl,
      String? thumbnailUrl}) {
    return _RankingMember(
      createdAt: createdAt,
      updatedAt: updatedAt,
      order: order,
      title: title,
      description: description,
      imageUrl: imageUrl,
      thumbnailUrl: thumbnailUrl,
    );
  }

  RankingMember fromJson(Map<String, Object?> json) {
    return RankingMember.fromJson(json);
  }
}

/// @nodoc
const $RankingMember = _$RankingMemberTearOff();

/// @nodoc
mixin _$RankingMember {
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
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
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
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
abstract class _$RankingMemberCopyWith<$Res>
    implements $RankingMemberCopyWith<$Res> {
  factory _$RankingMemberCopyWith(
          _RankingMember value, $Res Function(_RankingMember) then) =
      __$RankingMemberCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      double order,
      String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl});
}

/// @nodoc
class __$RankingMemberCopyWithImpl<$Res>
    extends _$RankingMemberCopyWithImpl<$Res>
    implements _$RankingMemberCopyWith<$Res> {
  __$RankingMemberCopyWithImpl(
      _RankingMember _value, $Res Function(_RankingMember) _then)
      : super(_value, (v) => _then(v as _RankingMember));

  @override
  _RankingMember get _value => super._value as _RankingMember;

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
    return _then(_RankingMember(
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
@JsonSerializable()
class _$_RankingMember with DiagnosticableTreeMixin implements _RankingMember {
  const _$_RankingMember(
      {@TimestampOrNullConverter() this.createdAt,
      @TimestampOrNullConverter() this.updatedAt,
      required this.order,
      required this.title,
      this.description = '',
      this.imageUrl,
      this.thumbnailUrl});

  factory _$_RankingMember.fromJson(Map<String, dynamic> json) =>
      _$$_RankingMemberFromJson(json);

  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;
  @override
  @TimestampOrNullConverter()
  final DateTime? updatedAt;
  @override

  /// 順番
  final double order;
  @override

  /// 項目名
  final String title;
  @JsonKey()
  @override

  /// 項目に対するコメント
  final String description;
  @override

  /// 項目の画像
  final String? imageUrl;
  @override

  /// 項目のサムネイル画像
  final String? thumbnailUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RankingMember(createdAt: $createdAt, updatedAt: $updatedAt, order: $order, title: $title, description: $description, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RankingMember'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RankingMember &&
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
  _$RankingMemberCopyWith<_RankingMember> get copyWith =>
      __$RankingMemberCopyWithImpl<_RankingMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RankingMemberToJson(this);
  }
}

abstract class _RankingMember implements RankingMember {
  const factory _RankingMember(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      required double order,
      required String title,
      String description,
      String? imageUrl,
      String? thumbnailUrl}) = _$_RankingMember;

  factory _RankingMember.fromJson(Map<String, dynamic> json) =
      _$_RankingMember.fromJson;

  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt;
  @override
  @TimestampOrNullConverter()
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
  _$RankingMemberCopyWith<_RankingMember> get copyWith =>
      throw _privateConstructorUsedError;
}
