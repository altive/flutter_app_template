// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockName {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockNameCopyWith<StockName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockNameCopyWith<$Res> {
  factory $StockNameCopyWith(StockName value, $Res Function(StockName) then) =
      _$StockNameCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$StockNameCopyWithImpl<$Res> implements $StockNameCopyWith<$Res> {
  _$StockNameCopyWithImpl(this._value, this._then);

  final StockName _value;
  // ignore: unused_field
  final $Res Function(StockName) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StockNameCopyWith<$Res> implements $StockNameCopyWith<$Res> {
  factory _$$_StockNameCopyWith(
          _$_StockName value, $Res Function(_$_StockName) then) =
      __$$_StockNameCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_StockNameCopyWithImpl<$Res> extends _$StockNameCopyWithImpl<$Res>
    implements _$$_StockNameCopyWith<$Res> {
  __$$_StockNameCopyWithImpl(
      _$_StockName _value, $Res Function(_$_StockName) _then)
      : super(_value, (v) => _then(v as _$_StockName));

  @override
  _$_StockName get _value => super._value as _$_StockName;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_StockName(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StockName with DiagnosticableTreeMixin implements _StockName {
  const _$_StockName(this.value);

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockName(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockName'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockName &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_StockNameCopyWith<_$_StockName> get copyWith =>
      __$$_StockNameCopyWithImpl<_$_StockName>(this, _$identity);
}

abstract class _StockName implements StockName {
  const factory _StockName(final String value) = _$_StockName;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StockNameCopyWith<_$_StockName> get copyWith =>
      throw _privateConstructorUsedError;
}

StockEntity _$StockEntityFromJson(Map<String, dynamic> json) {
  return _StockEntity.fromJson(json);
}

/// @nodoc
mixin _$StockEntity {
  /// ??????????????????????????????????????? `id` ??????????????????????????????
  /// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  String? get id => throw _privateConstructorUsedError;

  /// ????????????????????????????????????
  int get idNumber => throw _privateConstructorUsedError;

  /// ????????????
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// ????????????
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// ?????????????????????
  @StockNameConverter()
  StockName get name => throw _privateConstructorUsedError;

  /// ????????????????????????Amazon??????????????????????????????????????????
  /// ???????????????????????????????????????????????? @nullable
  String? get originalName => throw _privateConstructorUsedError;

  /// ??????????????????????????????
  double get numberOfItems => throw _privateConstructorUsedError;

  /// Amazon?????????????????? @nullable
  String? get asin => throw _privateConstructorUsedError;

  /// ????????????????????????????????????ID??????????????????????????????ID??????????????? @nullable
  String? get itemId => throw _privateConstructorUsedError;

  /// ?????????????????????????????????????????????
  /// v2.2.1: ?????????????????? `productCategory` ?????????
  @JsonKey(name: StockEntityField.productCategory)
  String get productCategory => throw _privateConstructorUsedError;

  /// ???????????????
  int get expirationDateTypeInt => throw _privateConstructorUsedError;

  /// ???????????? or ???????????? @nullable
  @TimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;

  /// Amazon?????????Url @nullable
  String? get amazonUrl => throw _privateConstructorUsedError;

  /// Amazon???????????????????????? @nullable
  String? get imageUrlSmall => throw _privateConstructorUsedError;

  /// Amazon???????????????????????? @nullable
  String? get imageUrlMedium => throw _privateConstructorUsedError;

  /// Amazon???????????????????????? @nullable
  String? get imageUrlLarge => throw _privateConstructorUsedError;

  /// ???????????????Storage???????????????200x200??? @nullable
  String? get imagePathSmall => throw _privateConstructorUsedError;

  /// ???????????????Storage???????????????400x400??? @nullable
  String? get imagePathMedium => throw _privateConstructorUsedError;

  /// ???????????????Storage???????????????600x600??? @nullable
  String? get imagePathLarge => throw _privateConstructorUsedError;

  /// ???????????????Storage???????????????600x600??? @nullable
  String? get imagePathOriginal => throw _privateConstructorUsedError;

  /// ?????? @nullable
  String? get memo => throw _privateConstructorUsedError;

  /// ???????????? @nullable
  /// added: v1.9.0
  /// v2.2.1: ?????????????????? `stockCategory` ?????????
  @JsonKey(name: StockEntityField.stockCategory)
  String? get stockCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockEntityCopyWith<StockEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEntityCopyWith<$Res> {
  factory $StockEntityCopyWith(
          StockEntity value, $Res Function(StockEntity) then) =
      _$StockEntityCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int idNumber,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      @StockNameConverter() StockName name,
      String? originalName,
      double numberOfItems,
      String? asin,
      String? itemId,
      @JsonKey(name: StockEntityField.productCategory) String productCategory,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String? amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge,
      String? imagePathSmall,
      String? imagePathMedium,
      String? imagePathLarge,
      String? imagePathOriginal,
      String? memo,
      @JsonKey(name: StockEntityField.stockCategory) String? stockCategory});

  $StockNameCopyWith<$Res> get name;
}

/// @nodoc
class _$StockEntityCopyWithImpl<$Res> implements $StockEntityCopyWith<$Res> {
  _$StockEntityCopyWithImpl(this._value, this._then);

  final StockEntity _value;
  // ignore: unused_field
  final $Res Function(StockEntity) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? idNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? originalName = freezed,
    Object? numberOfItems = freezed,
    Object? asin = freezed,
    Object? itemId = freezed,
    Object? productCategory = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
    Object? imagePathSmall = freezed,
    Object? imagePathMedium = freezed,
    Object? imagePathLarge = freezed,
    Object? imagePathOriginal = freezed,
    Object? memo = freezed,
    Object? stockCategory = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StockName,
      originalName: originalName == freezed
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as double,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: productCategory == freezed
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
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
      imagePathSmall: imagePathSmall == freezed
          ? _value.imagePathSmall
          : imagePathSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathMedium: imagePathMedium == freezed
          ? _value.imagePathMedium
          : imagePathMedium // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathLarge: imagePathLarge == freezed
          ? _value.imagePathLarge
          : imagePathLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathOriginal: imagePathOriginal == freezed
          ? _value.imagePathOriginal
          : imagePathOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      stockCategory: stockCategory == freezed
          ? _value.stockCategory
          : stockCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $StockNameCopyWith<$Res> get name {
    return $StockNameCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value));
    });
  }
}

/// @nodoc
abstract class _$$_StockEntityCopyWith<$Res>
    implements $StockEntityCopyWith<$Res> {
  factory _$$_StockEntityCopyWith(
          _$_StockEntity value, $Res Function(_$_StockEntity) then) =
      __$$_StockEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int idNumber,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      @StockNameConverter() StockName name,
      String? originalName,
      double numberOfItems,
      String? asin,
      String? itemId,
      @JsonKey(name: StockEntityField.productCategory) String productCategory,
      int expirationDateTypeInt,
      @TimestampConverter() DateTime? expirationAt,
      String? amazonUrl,
      String? imageUrlSmall,
      String? imageUrlMedium,
      String? imageUrlLarge,
      String? imagePathSmall,
      String? imagePathMedium,
      String? imagePathLarge,
      String? imagePathOriginal,
      String? memo,
      @JsonKey(name: StockEntityField.stockCategory) String? stockCategory});

  @override
  $StockNameCopyWith<$Res> get name;
}

/// @nodoc
class __$$_StockEntityCopyWithImpl<$Res> extends _$StockEntityCopyWithImpl<$Res>
    implements _$$_StockEntityCopyWith<$Res> {
  __$$_StockEntityCopyWithImpl(
      _$_StockEntity _value, $Res Function(_$_StockEntity) _then)
      : super(_value, (v) => _then(v as _$_StockEntity));

  @override
  _$_StockEntity get _value => super._value as _$_StockEntity;

  @override
  $Res call({
    Object? id = freezed,
    Object? idNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? name = freezed,
    Object? originalName = freezed,
    Object? numberOfItems = freezed,
    Object? asin = freezed,
    Object? itemId = freezed,
    Object? productCategory = freezed,
    Object? expirationDateTypeInt = freezed,
    Object? expirationAt = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrlSmall = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlLarge = freezed,
    Object? imagePathSmall = freezed,
    Object? imagePathMedium = freezed,
    Object? imagePathLarge = freezed,
    Object? imagePathOriginal = freezed,
    Object? memo = freezed,
    Object? stockCategory = freezed,
  }) {
    return _then(_$_StockEntity(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idNumber: idNumber == freezed
          ? _value.idNumber
          : idNumber // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StockName,
      originalName: originalName == freezed
          ? _value.originalName
          : originalName // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as double,
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: itemId == freezed
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: productCategory == freezed
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
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
      imagePathSmall: imagePathSmall == freezed
          ? _value.imagePathSmall
          : imagePathSmall // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathMedium: imagePathMedium == freezed
          ? _value.imagePathMedium
          : imagePathMedium // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathLarge: imagePathLarge == freezed
          ? _value.imagePathLarge
          : imagePathLarge // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePathOriginal: imagePathOriginal == freezed
          ? _value.imagePathOriginal
          : imagePathOriginal // ignore: cast_nullable_to_non_nullable
              as String?,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      stockCategory: stockCategory == freezed
          ? _value.stockCategory
          : stockCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StockEntity extends _StockEntity with DiagnosticableTreeMixin {
  const _$_StockEntity(
      {required this.id,
      required this.idNumber,
      @TimestampConverter()
          this.createdAt,
      @TimestampConverter()
          this.updatedAt,
      @StockNameConverter()
          required this.name,
      this.originalName,
      required this.numberOfItems,
      required this.asin,
      required this.itemId,
      @JsonKey(name: StockEntityField.productCategory)
          required this.productCategory,
      required this.expirationDateTypeInt,
      @TimestampConverter()
          this.expirationAt,
      required this.amazonUrl,
      this.imageUrlSmall,
      this.imageUrlMedium,
      this.imageUrlLarge,
      this.imagePathSmall,
      this.imagePathMedium,
      this.imagePathLarge,
      this.imagePathOriginal,
      this.memo,
      @JsonKey(name: StockEntityField.stockCategory)
          this.stockCategory})
      : super._();

  factory _$_StockEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StockEntityFromJson(json);

  /// ??????????????????????????????????????? `id` ??????????????????????????????
  /// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  @override
  final String? id;

  /// ????????????????????????????????????
  @override
  final int idNumber;

  /// ????????????
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  /// ????????????
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  /// ?????????????????????
  @override
  @StockNameConverter()
  final StockName name;

  /// ????????????????????????Amazon??????????????????????????????????????????
  /// ???????????????????????????????????????????????? @nullable
  @override
  final String? originalName;

  /// ??????????????????????????????
  @override
  final double numberOfItems;

  /// Amazon?????????????????? @nullable
  @override
  final String? asin;

  /// ????????????????????????????????????ID??????????????????????????????ID??????????????? @nullable
  @override
  final String? itemId;

  /// ?????????????????????????????????????????????
  /// v2.2.1: ?????????????????? `productCategory` ?????????
  @override
  @JsonKey(name: StockEntityField.productCategory)
  final String productCategory;

  /// ???????????????
  @override
  final int expirationDateTypeInt;

  /// ???????????? or ???????????? @nullable
  @override
  @TimestampConverter()
  final DateTime? expirationAt;

  /// Amazon?????????Url @nullable
  @override
  final String? amazonUrl;

  /// Amazon???????????????????????? @nullable
  @override
  final String? imageUrlSmall;

  /// Amazon???????????????????????? @nullable
  @override
  final String? imageUrlMedium;

  /// Amazon???????????????????????? @nullable
  @override
  final String? imageUrlLarge;

  /// ???????????????Storage???????????????200x200??? @nullable
  @override
  final String? imagePathSmall;

  /// ???????????????Storage???????????????400x400??? @nullable
  @override
  final String? imagePathMedium;

  /// ???????????????Storage???????????????600x600??? @nullable
  @override
  final String? imagePathLarge;

  /// ???????????????Storage???????????????600x600??? @nullable
  @override
  final String? imagePathOriginal;

  /// ?????? @nullable
  @override
  final String? memo;

  /// ???????????? @nullable
  /// added: v1.9.0
  /// v2.2.1: ?????????????????? `stockCategory` ?????????
  @override
  @JsonKey(name: StockEntityField.stockCategory)
  final String? stockCategory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockEntity(id: $id, idNumber: $idNumber, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, originalName: $originalName, numberOfItems: $numberOfItems, asin: $asin, itemId: $itemId, productCategory: $productCategory, expirationDateTypeInt: $expirationDateTypeInt, expirationAt: $expirationAt, amazonUrl: $amazonUrl, imageUrlSmall: $imageUrlSmall, imageUrlMedium: $imageUrlMedium, imageUrlLarge: $imageUrlLarge, imagePathSmall: $imagePathSmall, imagePathMedium: $imagePathMedium, imagePathLarge: $imagePathLarge, imagePathOriginal: $imagePathOriginal, memo: $memo, stockCategory: $stockCategory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockEntity'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('idNumber', idNumber))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('originalName', originalName))
      ..add(DiagnosticsProperty('numberOfItems', numberOfItems))
      ..add(DiagnosticsProperty('asin', asin))
      ..add(DiagnosticsProperty('itemId', itemId))
      ..add(DiagnosticsProperty('productCategory', productCategory))
      ..add(DiagnosticsProperty('expirationDateTypeInt', expirationDateTypeInt))
      ..add(DiagnosticsProperty('expirationAt', expirationAt))
      ..add(DiagnosticsProperty('amazonUrl', amazonUrl))
      ..add(DiagnosticsProperty('imageUrlSmall', imageUrlSmall))
      ..add(DiagnosticsProperty('imageUrlMedium', imageUrlMedium))
      ..add(DiagnosticsProperty('imageUrlLarge', imageUrlLarge))
      ..add(DiagnosticsProperty('imagePathSmall', imagePathSmall))
      ..add(DiagnosticsProperty('imagePathMedium', imagePathMedium))
      ..add(DiagnosticsProperty('imagePathLarge', imagePathLarge))
      ..add(DiagnosticsProperty('imagePathOriginal', imagePathOriginal))
      ..add(DiagnosticsProperty('memo', memo))
      ..add(DiagnosticsProperty('stockCategory', stockCategory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockEntity &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.idNumber, idNumber) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.originalName, originalName) &&
            const DeepCollectionEquality()
                .equals(other.numberOfItems, numberOfItems) &&
            const DeepCollectionEquality().equals(other.asin, asin) &&
            const DeepCollectionEquality().equals(other.itemId, itemId) &&
            const DeepCollectionEquality()
                .equals(other.productCategory, productCategory) &&
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
            const DeepCollectionEquality()
                .equals(other.imagePathSmall, imagePathSmall) &&
            const DeepCollectionEquality()
                .equals(other.imagePathMedium, imagePathMedium) &&
            const DeepCollectionEquality()
                .equals(other.imagePathLarge, imagePathLarge) &&
            const DeepCollectionEquality()
                .equals(other.imagePathOriginal, imagePathOriginal) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality()
                .equals(other.stockCategory, stockCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(idNumber),
        const DeepCollectionEquality().hash(createdAt),
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(name),
        const DeepCollectionEquality().hash(originalName),
        const DeepCollectionEquality().hash(numberOfItems),
        const DeepCollectionEquality().hash(asin),
        const DeepCollectionEquality().hash(itemId),
        const DeepCollectionEquality().hash(productCategory),
        const DeepCollectionEquality().hash(expirationDateTypeInt),
        const DeepCollectionEquality().hash(expirationAt),
        const DeepCollectionEquality().hash(amazonUrl),
        const DeepCollectionEquality().hash(imageUrlSmall),
        const DeepCollectionEquality().hash(imageUrlMedium),
        const DeepCollectionEquality().hash(imageUrlLarge),
        const DeepCollectionEquality().hash(imagePathSmall),
        const DeepCollectionEquality().hash(imagePathMedium),
        const DeepCollectionEquality().hash(imagePathLarge),
        const DeepCollectionEquality().hash(imagePathOriginal),
        const DeepCollectionEquality().hash(memo),
        const DeepCollectionEquality().hash(stockCategory)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_StockEntityCopyWith<_$_StockEntity> get copyWith =>
      __$$_StockEntityCopyWithImpl<_$_StockEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StockEntityToJson(this);
  }
}

abstract class _StockEntity extends StockEntity {
  const factory _StockEntity(
      {required final String? id,
      required final int idNumber,
      @TimestampConverter()
          final DateTime? createdAt,
      @TimestampConverter()
          final DateTime? updatedAt,
      @StockNameConverter()
          required final StockName name,
      final String? originalName,
      required final double numberOfItems,
      required final String? asin,
      required final String? itemId,
      @JsonKey(name: StockEntityField.productCategory)
          required final String productCategory,
      required final int expirationDateTypeInt,
      @TimestampConverter()
          final DateTime? expirationAt,
      required final String? amazonUrl,
      final String? imageUrlSmall,
      final String? imageUrlMedium,
      final String? imageUrlLarge,
      final String? imagePathSmall,
      final String? imagePathMedium,
      final String? imagePathLarge,
      final String? imagePathOriginal,
      final String? memo,
      @JsonKey(name: StockEntityField.stockCategory)
          final String? stockCategory}) = _$_StockEntity;
  const _StockEntity._() : super._();

  factory _StockEntity.fromJson(Map<String, dynamic> json) =
      _$_StockEntity.fromJson;

  @override

  /// ??????????????????????????????????????? `id` ??????????????????????????????
  /// ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  String? get id => throw _privateConstructorUsedError;
  @override

  /// ????????????????????????????????????
  int get idNumber => throw _privateConstructorUsedError;
  @override

  /// ????????????
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override

  /// ????????????
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override

  /// ?????????????????????
  @StockNameConverter()
  StockName get name => throw _privateConstructorUsedError;
  @override

  /// ????????????????????????Amazon??????????????????????????????????????????
  /// ???????????????????????????????????????????????? @nullable
  String? get originalName => throw _privateConstructorUsedError;
  @override

  /// ??????????????????????????????
  double get numberOfItems => throw _privateConstructorUsedError;
  @override

  /// Amazon?????????????????? @nullable
  String? get asin => throw _privateConstructorUsedError;
  @override

  /// ????????????????????????????????????ID??????????????????????????????ID??????????????? @nullable
  String? get itemId => throw _privateConstructorUsedError;
  @override

  /// ?????????????????????????????????????????????
  /// v2.2.1: ?????????????????? `productCategory` ?????????
  @JsonKey(name: StockEntityField.productCategory)
  String get productCategory => throw _privateConstructorUsedError;
  @override

  /// ???????????????
  int get expirationDateTypeInt => throw _privateConstructorUsedError;
  @override

  /// ???????????? or ???????????? @nullable
  @TimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;
  @override

  /// Amazon?????????Url @nullable
  String? get amazonUrl => throw _privateConstructorUsedError;
  @override

  /// Amazon???????????????????????? @nullable
  String? get imageUrlSmall => throw _privateConstructorUsedError;
  @override

  /// Amazon???????????????????????? @nullable
  String? get imageUrlMedium => throw _privateConstructorUsedError;
  @override

  /// Amazon???????????????????????? @nullable
  String? get imageUrlLarge => throw _privateConstructorUsedError;
  @override

  /// ???????????????Storage???????????????200x200??? @nullable
  String? get imagePathSmall => throw _privateConstructorUsedError;
  @override

  /// ???????????????Storage???????????????400x400??? @nullable
  String? get imagePathMedium => throw _privateConstructorUsedError;
  @override

  /// ???????????????Storage???????????????600x600??? @nullable
  String? get imagePathLarge => throw _privateConstructorUsedError;
  @override

  /// ???????????????Storage???????????????600x600??? @nullable
  String? get imagePathOriginal => throw _privateConstructorUsedError;
  @override

  /// ?????? @nullable
  String? get memo => throw _privateConstructorUsedError;
  @override

  /// ???????????? @nullable
  /// added: v1.9.0
  /// v2.2.1: ?????????????????? `stockCategory` ?????????
  @JsonKey(name: StockEntityField.stockCategory)
  String? get stockCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StockEntityCopyWith<_$_StockEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
