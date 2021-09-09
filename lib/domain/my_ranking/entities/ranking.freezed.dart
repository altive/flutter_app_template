// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ranking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ranking _$RankingFromJson(Map<String, dynamic> json) {
  return _Ranking.fromJson(json);
}

/// @nodoc
class _$RankingTearOff {
  const _$RankingTearOff();

  _Ranking call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      required String userId,
      String title = '',
      String comment = '',
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned = false,
      List<String> orders = const <String>[]}) {
    return _Ranking(
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
      title: title,
      comment: comment,
      imageUrl: imageUrl,
      thumbnailUrl: thumbnailUrl,
      pinned: pinned,
      orders: orders,
    );
  }

  Ranking fromJson(Map<String, Object> json) {
    return Ranking.fromJson(json);
  }
}

/// @nodoc
const $Ranking = _$RankingTearOff();

/// @nodoc
mixin _$Ranking {
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampOrNullConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 作成者であるユーザーのID
  String get userId => throw _privateConstructorUsedError;

  /// ランキングタイトル
  String get title => throw _privateConstructorUsedError;

  /// ランキングに対するコメント
  String get comment => throw _privateConstructorUsedError;

  /// ランキングの画像
  String? get imageUrl => throw _privateConstructorUsedError;

  /// ランキングのサムネイル画像
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  /// 優先して表示させたいランキングなら `true`
  bool get pinned => throw _privateConstructorUsedError;

  /// ランキングメンバーの順序
  List<String> get orders => throw _privateConstructorUsedError;

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
      String userId,
      String title,
      String comment,
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned,
      List<String> orders});
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
    Object? userId = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? pinned = freezed,
    Object? orders = freezed,
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
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
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
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$RankingCopyWith<$Res> implements $RankingCopyWith<$Res> {
  factory _$RankingCopyWith(_Ranking value, $Res Function(_Ranking) then) =
      __$RankingCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      String userId,
      String title,
      String comment,
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned,
      List<String> orders});
}

/// @nodoc
class __$RankingCopyWithImpl<$Res> extends _$RankingCopyWithImpl<$Res>
    implements _$RankingCopyWith<$Res> {
  __$RankingCopyWithImpl(_Ranking _value, $Res Function(_Ranking) _then)
      : super(_value, (v) => _then(v as _Ranking));

  @override
  _Ranking get _value => super._value as _Ranking;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? imageUrl = freezed,
    Object? thumbnailUrl = freezed,
    Object? pinned = freezed,
    Object? orders = freezed,
  }) {
    return _then(_Ranking(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
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
      orders: orders == freezed
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ranking with DiagnosticableTreeMixin implements _Ranking {
  const _$_Ranking(
      {@TimestampOrNullConverter() this.createdAt,
      @TimestampOrNullConverter() this.updatedAt,
      required this.userId,
      this.title = '',
      this.comment = '',
      this.imageUrl,
      this.thumbnailUrl,
      this.pinned = false,
      this.orders = const <String>[]});

  factory _$_Ranking.fromJson(Map<String, dynamic> json) =>
      _$_$_RankingFromJson(json);

  @override
  @TimestampOrNullConverter()
  final DateTime? createdAt;
  @override
  @TimestampOrNullConverter()
  final DateTime? updatedAt;
  @override

  /// 作成者であるユーザーのID
  final String userId;
  @JsonKey(defaultValue: '')
  @override

  /// ランキングタイトル
  final String title;
  @JsonKey(defaultValue: '')
  @override

  /// ランキングに対するコメント
  final String comment;
  @override

  /// ランキングの画像
  final String? imageUrl;
  @override

  /// ランキングのサムネイル画像
  final String? thumbnailUrl;
  @JsonKey(defaultValue: false)
  @override

  /// 優先して表示させたいランキングなら `true`
  final bool pinned;
  @JsonKey(defaultValue: const <String>[])
  @override

  /// ランキングメンバーの順序
  final List<String> orders;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Ranking(createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, title: $title, comment: $comment, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl, pinned: $pinned, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Ranking'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('imageUrl', imageUrl))
      ..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))
      ..add(DiagnosticsProperty('pinned', pinned))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ranking &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnailUrl, thumbnailUrl)) &&
            (identical(other.pinned, pinned) ||
                const DeepCollectionEquality().equals(other.pinned, pinned)) &&
            (identical(other.orders, orders) ||
                const DeepCollectionEquality().equals(other.orders, orders)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(thumbnailUrl) ^
      const DeepCollectionEquality().hash(pinned) ^
      const DeepCollectionEquality().hash(orders);

  @JsonKey(ignore: true)
  @override
  _$RankingCopyWith<_Ranking> get copyWith =>
      __$RankingCopyWithImpl<_Ranking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RankingToJson(this);
  }
}

abstract class _Ranking implements Ranking {
  const factory _Ranking(
      {@TimestampOrNullConverter() DateTime? createdAt,
      @TimestampOrNullConverter() DateTime? updatedAt,
      required String userId,
      String title,
      String comment,
      String? imageUrl,
      String? thumbnailUrl,
      bool pinned,
      List<String> orders}) = _$_Ranking;

  factory _Ranking.fromJson(Map<String, dynamic> json) = _$_Ranking.fromJson;

  @override
  @TimestampOrNullConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampOrNullConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override

  /// 作成者であるユーザーのID
  String get userId => throw _privateConstructorUsedError;
  @override

  /// ランキングタイトル
  String get title => throw _privateConstructorUsedError;
  @override

  /// ランキングに対するコメント
  String get comment => throw _privateConstructorUsedError;
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

  /// ランキングメンバーの順序
  List<String> get orders => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RankingCopyWith<_Ranking> get copyWith =>
      throw _privateConstructorUsedError;
}
