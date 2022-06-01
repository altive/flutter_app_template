// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) {
  return _FavoriteItem.fromJson(json);
}

/// @nodoc
mixin _$FavoriteItem {
  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// アイテムの名前
  String get name => throw _privateConstructorUsedError;

  /// Amazonの商品コード @nullable
  String? get asin => throw _privateConstructorUsedError;

  /// 商品カテゴリ
  String get category => throw _privateConstructorUsedError;

  /// 期限の種類
  int get expirationDateTypeInt => throw _privateConstructorUsedError;

  /// 消費期限 or 賞味期限 @nullable
  @TimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;

  /// Amazonの商品Url @nullable
  String? get amazonUrl => throw _privateConstructorUsedError;

  /// Amazonの商品画像（小） @nullable
  String? get imageUrlSmall => throw _privateConstructorUsedError;

  /// Amazonの商品画像（中） @nullable
  String? get imageUrlMedium => throw _privateConstructorUsedError;

  /// Amazonの商品画像（大） @nullable
  String? get imageUrlLarge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteItemCopyWith<FavoriteItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteItemCopyWith<$Res> {
  factory $FavoriteItemCopyWith(
          FavoriteItem value, $Res Function(FavoriteItem) then) =
      _$FavoriteItemCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      String name,
      String? asin,
      String category,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String? amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge});
}

/// @nodoc
class _$FavoriteItemCopyWithImpl<$Res> implements $FavoriteItemCopyWith<$Res> {
  _$FavoriteItemCopyWithImpl(this._value, this._then);

  final FavoriteItem _value;
  // ignore: unused_field
  final $Res Function(FavoriteItem) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? asin = freezed,
    Object? category = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDateTypeInt: expirationDateTypeInt == freezed
          ? _value.expirationDateTypeInt
          : expirationDateTypeInt // ignore: cast_nullable_to_non_nullable
              as int,
      expirationAt: expirationAt == freezed
          ? _value.expirationAt
          : expirationAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amazonUrl: amazonUrl == freezed
          ? _value.amazonUrl
          : amazonUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlSmall: imageUrlSmall == freezed
          ? _value.imageUrlSmall
          : imageUrlSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlMedium: imageUrlMedium == freezed
          ? _value.imageUrlMedium
          : imageUrlMedium // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlLarge: imageUrlLarge == freezed
          ? _value.imageUrlLarge
          : imageUrlLarge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteItemCopyWith<$Res>
    implements $FavoriteItemCopyWith<$Res> {
  factory _$$_FavoriteItemCopyWith(
          _$_FavoriteItem value, $Res Function(_$_FavoriteItem) then) =
      __$$_FavoriteItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      String name,
      String? asin,
      String category,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String? amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge});
}

/// @nodoc
class __$$_FavoriteItemCopyWithImpl<$Res>
    extends _$FavoriteItemCopyWithImpl<$Res>
    implements _$$_FavoriteItemCopyWith<$Res> {
  __$$_FavoriteItemCopyWithImpl(
      _$_FavoriteItem _value, $Res Function(_$_FavoriteItem) _then)
      : super(_value, (v) => _then(v as _$_FavoriteItem));

  @override
  _$_FavoriteItem get _value => super._value as _$_FavoriteItem;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? asin = freezed,
    Object? category = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
  }) {
    return _then(_$_FavoriteItem(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDateTypeInt: expirationDateTypeInt == freezed
          ? _value.expirationDateTypeInt
          : expirationDateTypeInt // ignore: cast_nullable_to_non_nullable
              as int,
      expirationAt: expirationAt == freezed
          ? _value.expirationAt
          : expirationAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amazonUrl: amazonUrl == freezed
          ? _value.amazonUrl
          : amazonUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlSmall: imageUrlSmall == freezed
          ? _value.imageUrlSmall
          : imageUrlSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlMedium: imageUrlMedium == freezed
          ? _value.imageUrlMedium
          : imageUrlMedium // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrlLarge: imageUrlLarge == freezed
          ? _value.imageUrlLarge
          : imageUrlLarge // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FavoriteItem extends _FavoriteItem with DiagnosticableTreeMixin {
  const _$_FavoriteItem(
      {@TimestampConverter() this.createdAt,
      required this.name,
      required this.asin,
      required this.category,
      required this.expirationDateTypeInt,
      @TimestampConverter() this.expirationAt,
      required this.amazonUrl,
      this.imageUrlSmall,
      this.imageUrlMedium,
      this.imageUrlLarge})
      : super._();

  factory _$_FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteItemFromJson(json);

  /// 作成日時
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  /// アイテムの名前
  @override
  final String name;

  /// Amazonの商品コード @nullable
  @override
  final String? asin;

  /// 商品カテゴリ
  @override
  final String category;

  /// 期限の種類
  @override
  final int expirationDateTypeInt;

  /// 消費期限 or 賞味期限 @nullable
  @override
  @TimestampConverter()
  final DateTime? expirationAt;

  /// Amazonの商品Url @nullable
  @override
  final String? amazonUrl;

  /// Amazonの商品画像（小） @nullable
  @override
  final String? imageUrlSmall;

  /// Amazonの商品画像（中） @nullable
  @override
  final String? imageUrlMedium;

  /// Amazonの商品画像（大） @nullable
  @override
  final String? imageUrlLarge;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FavoriteItem(createdAt: $createdAt, name: $name, asin: $asin, category: $category, expirationDateTypeInt: $expirationDateTypeInt, expirationAt: $expirationAt, amazonUrl: $amazonUrl, imageUrlSmall: $imageUrlSmall, imageUrlMedium: $imageUrlMedium, imageUrlLarge: $imageUrlLarge)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FavoriteItem'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('asin', asin))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('expirationDateTypeInt', expirationDateTypeInt))
      ..add(DiagnosticsProperty('expirationAt', expirationAt))
      ..add(DiagnosticsProperty('amazonUrl', amazonUrl))
      ..add(DiagnosticsProperty('imageUrlSmall', imageUrlSmall))
      ..add(DiagnosticsProperty('imageUrlMedium', imageUrlMedium))
      ..add(DiagnosticsProperty('imageUrlLarge', imageUrlLarge));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteItem &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.expirationDateTypeInt, expirationDateTypeInt) &&
            const DeepCollectionEquality()
                .equals(other.expirationAt, expirationAt) &&
            const DeepCollectionEquality().equals(other.amazonUrl, amazonUrl) &&
            const DeepCollectionEquality()
                .equals(other.imageUrlSmall, imageUrlSmall) &&
            const DeepCollectionEquality()
                .equals(other.imageUrlMedium, imageUrlMedium) &&
            const DeepCollectionEquality()
                .equals(other.imageUrlLarge, imageUrlLarge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(expirationDateTypeInt),
      const DeepCollectionEquality().hash(expirationAt),
      const DeepCollectionEquality().hash(amazonUrl),
      const DeepCollectionEquality().hash(imageUrlSmall),
      const DeepCollectionEquality().hash(imageUrlMedium),
      const DeepCollectionEquality().hash(imageUrlLarge));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteItemCopyWith<_$_FavoriteItem> get copyWith =>
      __$$_FavoriteItemCopyWithImpl<_$_FavoriteItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteItemToJson(this);
  }
}

abstract class _FavoriteItem extends FavoriteItem {
  const factory _FavoriteItem(
      {@TimestampConverter() final DateTime? createdAt,
      required final String name,
      required final String? asin,
      required final String category,
      required final int expirationDateTypeInt,
      @TimestampConverter() final DateTime? expirationAt,
      required final String? amazonUrl,
      final String? imageUrlSmall,
      final String? imageUrlMedium,
      final String? imageUrlLarge}) = _$_FavoriteItem;
  const _FavoriteItem._() : super._();

  factory _FavoriteItem.fromJson(Map<String, dynamic> json) =
      _$_FavoriteItem.fromJson;

  @override

  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override

  /// アイテムの名前
  String get name => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品コード @nullable
  String? get asin => throw _privateConstructorUsedError;
  @override

  /// 商品カテゴリ
  String get category => throw _privateConstructorUsedError;
  @override

  /// 期限の種類
  int get expirationDateTypeInt => throw _privateConstructorUsedError;
  @override

  /// 消費期限 or 賞味期限 @nullable
  @TimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品Url @nullable
  String? get amazonUrl => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品画像（小） @nullable
  String? get imageUrlSmall => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品画像（中） @nullable
  String? get imageUrlMedium => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品画像（大） @nullable
  String? get imageUrlLarge => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteItemCopyWith<_$_FavoriteItem> get copyWith =>
      throw _privateConstructorUsedError;
}
