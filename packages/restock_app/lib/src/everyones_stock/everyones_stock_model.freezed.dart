// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'everyones_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EveryonesStockModel _$EveryonesStockModelFromJson(Map<String, dynamic> json) {
  return _EveryonesStockModel.fromJson(json);
}

/// @nodoc
mixin _$EveryonesStockModel {
  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// アイテムの名前
  String get name => throw _privateConstructorUsedError;

  /// アイテムのストック数
  double get numberOfItems => throw _privateConstructorUsedError;

  /// Amazonの商品コード @nullable
  String get asin => throw _privateConstructorUsedError;

  /// 商品カテゴリ
  String get category => throw _privateConstructorUsedError;

  /// 期限の種類
  int get expirationDateTypeInt => throw _privateConstructorUsedError;

  /// 消費期限 or 賞味期限 @nullable
  @TimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;

  /// Amazonの商品Url @nullable
  String get amazonUrl => throw _privateConstructorUsedError;

  /// Amazonの商品画像（小） @nullable
  String? get imageUrlSmall => throw _privateConstructorUsedError;

  /// Amazonの商品画像（中） @nullable
  String? get imageUrlMedium => throw _privateConstructorUsedError;

  /// Amazonの商品画像（大） @nullable
  String? get imageUrlLarge => throw _privateConstructorUsedError;

  /// ニックネーム @nullable
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EveryonesStockModelCopyWith<EveryonesStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EveryonesStockModelCopyWith<$Res> {
  factory $EveryonesStockModelCopyWith(
          EveryonesStockModel value, $Res Function(EveryonesStockModel) then) =
      _$EveryonesStockModelCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      String name,
      double numberOfItems,
      String asin,
      String category,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge,
      String nickname});
}

/// @nodoc
class _$EveryonesStockModelCopyWithImpl<$Res>
    implements $EveryonesStockModelCopyWith<$Res> {
  _$EveryonesStockModelCopyWithImpl(this._value, this._then);

  final EveryonesStockModel _value;
  // ignore: unused_field
  final $Res Function(EveryonesStockModel) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? numberOfItems = freezed,
    Object? asin = freezed,
    Object? category = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
    Object? nickname = freezed,
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
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as double,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
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
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_EveryonesStockModelCopyWith<$Res>
    implements $EveryonesStockModelCopyWith<$Res> {
  factory _$$_EveryonesStockModelCopyWith(_$_EveryonesStockModel value,
          $Res Function(_$_EveryonesStockModel) then) =
      __$$_EveryonesStockModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      String name,
      double numberOfItems,
      String asin,
      String category,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge,
      String nickname});
}

/// @nodoc
class __$$_EveryonesStockModelCopyWithImpl<$Res>
    extends _$EveryonesStockModelCopyWithImpl<$Res>
    implements _$$_EveryonesStockModelCopyWith<$Res> {
  __$$_EveryonesStockModelCopyWithImpl(_$_EveryonesStockModel _value,
      $Res Function(_$_EveryonesStockModel) _then)
      : super(_value, (v) => _then(v as _$_EveryonesStockModel));

  @override
  _$_EveryonesStockModel get _value => super._value as _$_EveryonesStockModel;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? name = freezed,
    Object? numberOfItems = freezed,
    Object? asin = freezed,
    Object? category = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_$_EveryonesStockModel(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as double,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
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
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EveryonesStockModel extends _EveryonesStockModel
    with DiagnosticableTreeMixin {
  const _$_EveryonesStockModel(
      {@TimestampConverter() this.createdAt,
      required this.name,
      required this.numberOfItems,
      required this.asin,
      required this.category,
      required this.expirationDateTypeInt,
      @TimestampConverter() this.expirationAt,
      required this.amazonUrl,
      this.imageUrlSmall,
      this.imageUrlMedium,
      this.imageUrlLarge,
      required this.nickname})
      : assert(name.length > 0, 'name cannot be empty'),
        super._();

  factory _$_EveryonesStockModel.fromJson(Map<String, dynamic> json) =>
      _$$_EveryonesStockModelFromJson(json);

  /// 作成日時
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  /// アイテムの名前
  @override
  final String name;

  /// アイテムのストック数
  @override
  final double numberOfItems;

  /// Amazonの商品コード @nullable
  @override
  final String asin;

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
  final String amazonUrl;

  /// Amazonの商品画像（小） @nullable
  @override
  final String? imageUrlSmall;

  /// Amazonの商品画像（中） @nullable
  @override
  final String? imageUrlMedium;

  /// Amazonの商品画像（大） @nullable
  @override
  final String? imageUrlLarge;

  /// ニックネーム @nullable
  @override
  final String nickname;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EveryonesStockModel(createdAt: $createdAt, name: $name, numberOfItems: $numberOfItems, asin: $asin, category: $category, expirationDateTypeInt: $expirationDateTypeInt, expirationAt: $expirationAt, amazonUrl: $amazonUrl, imageUrlSmall: $imageUrlSmall, imageUrlMedium: $imageUrlMedium, imageUrlLarge: $imageUrlLarge, nickname: $nickname)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EveryonesStockModel'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('numberOfItems', numberOfItems))
      ..add(DiagnosticsProperty('asin', asin))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('expirationDateTypeInt', expirationDateTypeInt))
      ..add(DiagnosticsProperty('expirationAt', expirationAt))
      ..add(DiagnosticsProperty('amazonUrl', amazonUrl))
      ..add(DiagnosticsProperty('imageUrlSmall', imageUrlSmall))
      ..add(DiagnosticsProperty('imageUrlMedium', imageUrlMedium))
      ..add(DiagnosticsProperty('imageUrlLarge', imageUrlLarge))
      ..add(DiagnosticsProperty('nickname', nickname));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EveryonesStockModel &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.numberOfItems, numberOfItems) &&
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
                .equals(other.imageUrlLarge, imageUrlLarge) &&
            const DeepCollectionEquality().equals(other.nickname, nickname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(numberOfItems),
      const DeepCollectionEquality().hash(asin),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(expirationDateTypeInt),
      const DeepCollectionEquality().hash(expirationAt),
      const DeepCollectionEquality().hash(amazonUrl),
      const DeepCollectionEquality().hash(imageUrlSmall),
      const DeepCollectionEquality().hash(imageUrlMedium),
      const DeepCollectionEquality().hash(imageUrlLarge),
      const DeepCollectionEquality().hash(nickname));

  @JsonKey(ignore: true)
  @override
  _$$_EveryonesStockModelCopyWith<_$_EveryonesStockModel> get copyWith =>
      __$$_EveryonesStockModelCopyWithImpl<_$_EveryonesStockModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EveryonesStockModelToJson(this);
  }
}

abstract class _EveryonesStockModel extends EveryonesStockModel {
  const factory _EveryonesStockModel(
      {@TimestampConverter() final DateTime? createdAt,
      required final String name,
      required final double numberOfItems,
      required final String asin,
      required final String category,
      required final int expirationDateTypeInt,
      @TimestampConverter() final DateTime? expirationAt,
      required final String amazonUrl,
      final String? imageUrlSmall,
      final String? imageUrlMedium,
      final String? imageUrlLarge,
      required final String nickname}) = _$_EveryonesStockModel;
  const _EveryonesStockModel._() : super._();

  factory _EveryonesStockModel.fromJson(Map<String, dynamic> json) =
      _$_EveryonesStockModel.fromJson;

  @override

  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override

  /// アイテムの名前
  String get name => throw _privateConstructorUsedError;
  @override

  /// アイテムのストック数
  double get numberOfItems => throw _privateConstructorUsedError;
  @override

  /// Amazonの商品コード @nullable
  String get asin => throw _privateConstructorUsedError;
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
  String get amazonUrl => throw _privateConstructorUsedError;
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

  /// ニックネーム @nullable
  String get nickname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_EveryonesStockModelCopyWith<_$_EveryonesStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}
