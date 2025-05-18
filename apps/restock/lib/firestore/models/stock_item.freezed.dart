// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StockItem _$StockItemFromJson(Map<String, dynamic> json) {
  return _StockItem.fromJson(json);
}

/// @nodoc
mixin _$StockItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get originalName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;
  int get numberOfItems => throw _privateConstructorUsedError;
  int get idNumber => throw _privateConstructorUsedError;
  int get expirationDateTypeInt => throw _privateConstructorUsedError;
  String? get amazonUrl => throw _privateConstructorUsedError;
  String? get asin => throw _privateConstructorUsedError;
  String? get itemId => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;
  String? get imagePathLarge => throw _privateConstructorUsedError;
  String? get imagePathMedium => throw _privateConstructorUsedError;
  String? get imagePathOriginal => throw _privateConstructorUsedError;
  String? get imagePathSmall => throw _privateConstructorUsedError;
  String? get imageUrlLarge => throw _privateConstructorUsedError;
  String? get imageUrlMedium => throw _privateConstructorUsedError;
  String? get imageUrlSmall => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime? get expirationAt => throw _privateConstructorUsedError;

  /// Serializes this StockItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StockItemCopyWith<StockItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockItemCopyWith<$Res> {
  factory $StockItemCopyWith(StockItem value, $Res Function(StockItem) then) =
      _$StockItemCopyWithImpl<$Res, StockItem>;
  @useResult
  $Res call({
    String id,
    String name,
    String originalName,
    String category,
    String place,
    int numberOfItems,
    int idNumber,
    int expirationDateTypeInt,
    String? amazonUrl,
    String? asin,
    String? itemId,
    String? memo,
    String? imagePathLarge,
    String? imagePathMedium,
    String? imagePathOriginal,
    String? imagePathSmall,
    String? imageUrlLarge,
    String? imageUrlMedium,
    String? imageUrlSmall,
    @DateTimeTimestampConverter() DateTime createdAt,
    @DateTimeTimestampConverter() DateTime updatedAt,
    @DateTimeTimestampConverter() DateTime? expirationAt,
  });
}

/// @nodoc
class _$StockItemCopyWithImpl<$Res, $Val extends StockItem>
    implements $StockItemCopyWith<$Res> {
  _$StockItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? category = null,
    Object? place = null,
    Object? numberOfItems = null,
    Object? idNumber = null,
    Object? expirationDateTypeInt = null,
    Object? amazonUrl = freezed,
    Object? asin = freezed,
    Object? itemId = freezed,
    Object? memo = freezed,
    Object? imagePathLarge = freezed,
    Object? imagePathMedium = freezed,
    Object? imagePathOriginal = freezed,
    Object? imagePathSmall = freezed,
    Object? imageUrlLarge = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlSmall = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expirationAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            originalName:
                null == originalName
                    ? _value.originalName
                    : originalName // ignore: cast_nullable_to_non_nullable
                        as String,
            category:
                null == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String,
            place:
                null == place
                    ? _value.place
                    : place // ignore: cast_nullable_to_non_nullable
                        as String,
            numberOfItems:
                null == numberOfItems
                    ? _value.numberOfItems
                    : numberOfItems // ignore: cast_nullable_to_non_nullable
                        as int,
            idNumber:
                null == idNumber
                    ? _value.idNumber
                    : idNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            expirationDateTypeInt:
                null == expirationDateTypeInt
                    ? _value.expirationDateTypeInt
                    : expirationDateTypeInt // ignore: cast_nullable_to_non_nullable
                        as int,
            amazonUrl:
                freezed == amazonUrl
                    ? _value.amazonUrl
                    : amazonUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            asin:
                freezed == asin
                    ? _value.asin
                    : asin // ignore: cast_nullable_to_non_nullable
                        as String?,
            itemId:
                freezed == itemId
                    ? _value.itemId
                    : itemId // ignore: cast_nullable_to_non_nullable
                        as String?,
            memo:
                freezed == memo
                    ? _value.memo
                    : memo // ignore: cast_nullable_to_non_nullable
                        as String?,
            imagePathLarge:
                freezed == imagePathLarge
                    ? _value.imagePathLarge
                    : imagePathLarge // ignore: cast_nullable_to_non_nullable
                        as String?,
            imagePathMedium:
                freezed == imagePathMedium
                    ? _value.imagePathMedium
                    : imagePathMedium // ignore: cast_nullable_to_non_nullable
                        as String?,
            imagePathOriginal:
                freezed == imagePathOriginal
                    ? _value.imagePathOriginal
                    : imagePathOriginal // ignore: cast_nullable_to_non_nullable
                        as String?,
            imagePathSmall:
                freezed == imagePathSmall
                    ? _value.imagePathSmall
                    : imagePathSmall // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrlLarge:
                freezed == imageUrlLarge
                    ? _value.imageUrlLarge
                    : imageUrlLarge // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrlMedium:
                freezed == imageUrlMedium
                    ? _value.imageUrlMedium
                    : imageUrlMedium // ignore: cast_nullable_to_non_nullable
                        as String?,
            imageUrlSmall:
                freezed == imageUrlSmall
                    ? _value.imageUrlSmall
                    : imageUrlSmall // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            expirationAt:
                freezed == expirationAt
                    ? _value.expirationAt
                    : expirationAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StockItemImplCopyWith<$Res>
    implements $StockItemCopyWith<$Res> {
  factory _$$StockItemImplCopyWith(
    _$StockItemImpl value,
    $Res Function(_$StockItemImpl) then,
  ) = __$$StockItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String originalName,
    String category,
    String place,
    int numberOfItems,
    int idNumber,
    int expirationDateTypeInt,
    String? amazonUrl,
    String? asin,
    String? itemId,
    String? memo,
    String? imagePathLarge,
    String? imagePathMedium,
    String? imagePathOriginal,
    String? imagePathSmall,
    String? imageUrlLarge,
    String? imageUrlMedium,
    String? imageUrlSmall,
    @DateTimeTimestampConverter() DateTime createdAt,
    @DateTimeTimestampConverter() DateTime updatedAt,
    @DateTimeTimestampConverter() DateTime? expirationAt,
  });
}

/// @nodoc
class __$$StockItemImplCopyWithImpl<$Res>
    extends _$StockItemCopyWithImpl<$Res, _$StockItemImpl>
    implements _$$StockItemImplCopyWith<$Res> {
  __$$StockItemImplCopyWithImpl(
    _$StockItemImpl _value,
    $Res Function(_$StockItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? originalName = null,
    Object? category = null,
    Object? place = null,
    Object? numberOfItems = null,
    Object? idNumber = null,
    Object? expirationDateTypeInt = null,
    Object? amazonUrl = freezed,
    Object? asin = freezed,
    Object? itemId = freezed,
    Object? memo = freezed,
    Object? imagePathLarge = freezed,
    Object? imagePathMedium = freezed,
    Object? imagePathOriginal = freezed,
    Object? imagePathSmall = freezed,
    Object? imageUrlLarge = freezed,
    Object? imageUrlMedium = freezed,
    Object? imageUrlSmall = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expirationAt = freezed,
  }) {
    return _then(
      _$StockItemImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        originalName:
            null == originalName
                ? _value.originalName
                : originalName // ignore: cast_nullable_to_non_nullable
                    as String,
        category:
            null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String,
        place:
            null == place
                ? _value.place
                : place // ignore: cast_nullable_to_non_nullable
                    as String,
        numberOfItems:
            null == numberOfItems
                ? _value.numberOfItems
                : numberOfItems // ignore: cast_nullable_to_non_nullable
                    as int,
        idNumber:
            null == idNumber
                ? _value.idNumber
                : idNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        expirationDateTypeInt:
            null == expirationDateTypeInt
                ? _value.expirationDateTypeInt
                : expirationDateTypeInt // ignore: cast_nullable_to_non_nullable
                    as int,
        amazonUrl:
            freezed == amazonUrl
                ? _value.amazonUrl
                : amazonUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        asin:
            freezed == asin
                ? _value.asin
                : asin // ignore: cast_nullable_to_non_nullable
                    as String?,
        itemId:
            freezed == itemId
                ? _value.itemId
                : itemId // ignore: cast_nullable_to_non_nullable
                    as String?,
        memo:
            freezed == memo
                ? _value.memo
                : memo // ignore: cast_nullable_to_non_nullable
                    as String?,
        imagePathLarge:
            freezed == imagePathLarge
                ? _value.imagePathLarge
                : imagePathLarge // ignore: cast_nullable_to_non_nullable
                    as String?,
        imagePathMedium:
            freezed == imagePathMedium
                ? _value.imagePathMedium
                : imagePathMedium // ignore: cast_nullable_to_non_nullable
                    as String?,
        imagePathOriginal:
            freezed == imagePathOriginal
                ? _value.imagePathOriginal
                : imagePathOriginal // ignore: cast_nullable_to_non_nullable
                    as String?,
        imagePathSmall:
            freezed == imagePathSmall
                ? _value.imagePathSmall
                : imagePathSmall // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrlLarge:
            freezed == imageUrlLarge
                ? _value.imageUrlLarge
                : imageUrlLarge // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrlMedium:
            freezed == imageUrlMedium
                ? _value.imageUrlMedium
                : imageUrlMedium // ignore: cast_nullable_to_non_nullable
                    as String?,
        imageUrlSmall:
            freezed == imageUrlSmall
                ? _value.imageUrlSmall
                : imageUrlSmall // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        expirationAt:
            freezed == expirationAt
                ? _value.expirationAt
                : expirationAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StockItemImpl extends _StockItem {
  const _$StockItemImpl({
    required this.id,
    required this.name,
    required this.originalName,
    required this.category,
    required this.place,
    required this.numberOfItems,
    required this.idNumber,
    required this.expirationDateTypeInt,
    this.amazonUrl,
    this.asin,
    this.itemId,
    this.memo,
    this.imagePathLarge,
    this.imagePathMedium,
    this.imagePathOriginal,
    this.imagePathSmall,
    this.imageUrlLarge,
    this.imageUrlMedium,
    this.imageUrlSmall,
    @DateTimeTimestampConverter() required this.createdAt,
    @DateTimeTimestampConverter() required this.updatedAt,
    @DateTimeTimestampConverter() this.expirationAt,
  }) : super._();

  factory _$StockItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String originalName;
  @override
  final String category;
  @override
  final String place;
  @override
  final int numberOfItems;
  @override
  final int idNumber;
  @override
  final int expirationDateTypeInt;
  @override
  final String? amazonUrl;
  @override
  final String? asin;
  @override
  final String? itemId;
  @override
  final String? memo;
  @override
  final String? imagePathLarge;
  @override
  final String? imagePathMedium;
  @override
  final String? imagePathOriginal;
  @override
  final String? imagePathSmall;
  @override
  final String? imageUrlLarge;
  @override
  final String? imageUrlMedium;
  @override
  final String? imageUrlSmall;
  @override
  @DateTimeTimestampConverter()
  final DateTime createdAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime updatedAt;
  @override
  @DateTimeTimestampConverter()
  final DateTime? expirationAt;

  @override
  String toString() {
    return 'StockItem(id: $id, name: $name, originalName: $originalName, category: $category, place: $place, numberOfItems: $numberOfItems, idNumber: $idNumber, expirationDateTypeInt: $expirationDateTypeInt, amazonUrl: $amazonUrl, asin: $asin, itemId: $itemId, memo: $memo, imagePathLarge: $imagePathLarge, imagePathMedium: $imagePathMedium, imagePathOriginal: $imagePathOriginal, imagePathSmall: $imagePathSmall, imageUrlLarge: $imageUrlLarge, imageUrlMedium: $imageUrlMedium, imageUrlSmall: $imageUrlSmall, createdAt: $createdAt, updatedAt: $updatedAt, expirationAt: $expirationAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.originalName, originalName) ||
                other.originalName == originalName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.numberOfItems, numberOfItems) ||
                other.numberOfItems == numberOfItems) &&
            (identical(other.idNumber, idNumber) ||
                other.idNumber == idNumber) &&
            (identical(other.expirationDateTypeInt, expirationDateTypeInt) ||
                other.expirationDateTypeInt == expirationDateTypeInt) &&
            (identical(other.amazonUrl, amazonUrl) ||
                other.amazonUrl == amazonUrl) &&
            (identical(other.asin, asin) || other.asin == asin) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.imagePathLarge, imagePathLarge) ||
                other.imagePathLarge == imagePathLarge) &&
            (identical(other.imagePathMedium, imagePathMedium) ||
                other.imagePathMedium == imagePathMedium) &&
            (identical(other.imagePathOriginal, imagePathOriginal) ||
                other.imagePathOriginal == imagePathOriginal) &&
            (identical(other.imagePathSmall, imagePathSmall) ||
                other.imagePathSmall == imagePathSmall) &&
            (identical(other.imageUrlLarge, imageUrlLarge) ||
                other.imageUrlLarge == imageUrlLarge) &&
            (identical(other.imageUrlMedium, imageUrlMedium) ||
                other.imageUrlMedium == imageUrlMedium) &&
            (identical(other.imageUrlSmall, imageUrlSmall) ||
                other.imageUrlSmall == imageUrlSmall) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expirationAt, expirationAt) ||
                other.expirationAt == expirationAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    name,
    originalName,
    category,
    place,
    numberOfItems,
    idNumber,
    expirationDateTypeInt,
    amazonUrl,
    asin,
    itemId,
    memo,
    imagePathLarge,
    imagePathMedium,
    imagePathOriginal,
    imagePathSmall,
    imageUrlLarge,
    imageUrlMedium,
    imageUrlSmall,
    createdAt,
    updatedAt,
    expirationAt,
  ]);

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StockItemImplCopyWith<_$StockItemImpl> get copyWith =>
      __$$StockItemImplCopyWithImpl<_$StockItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockItemImplToJson(this);
  }
}

abstract class _StockItem extends StockItem {
  const factory _StockItem({
    required final String id,
    required final String name,
    required final String originalName,
    required final String category,
    required final String place,
    required final int numberOfItems,
    required final int idNumber,
    required final int expirationDateTypeInt,
    final String? amazonUrl,
    final String? asin,
    final String? itemId,
    final String? memo,
    final String? imagePathLarge,
    final String? imagePathMedium,
    final String? imagePathOriginal,
    final String? imagePathSmall,
    final String? imageUrlLarge,
    final String? imageUrlMedium,
    final String? imageUrlSmall,
    @DateTimeTimestampConverter() required final DateTime createdAt,
    @DateTimeTimestampConverter() required final DateTime updatedAt,
    @DateTimeTimestampConverter() final DateTime? expirationAt,
  }) = _$StockItemImpl;
  const _StockItem._() : super._();

  factory _StockItem.fromJson(Map<String, dynamic> json) =
      _$StockItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get originalName;
  @override
  String get category;
  @override
  String get place;
  @override
  int get numberOfItems;
  @override
  int get idNumber;
  @override
  int get expirationDateTypeInt;
  @override
  String? get amazonUrl;
  @override
  String? get asin;
  @override
  String? get itemId;
  @override
  String? get memo;
  @override
  String? get imagePathLarge;
  @override
  String? get imagePathMedium;
  @override
  String? get imagePathOriginal;
  @override
  String? get imagePathSmall;
  @override
  String? get imageUrlLarge;
  @override
  String? get imageUrlMedium;
  @override
  String? get imageUrlSmall;
  @override
  @DateTimeTimestampConverter()
  DateTime get createdAt;
  @override
  @DateTimeTimestampConverter()
  DateTime get updatedAt;
  @override
  @DateTimeTimestampConverter()
  DateTime? get expirationAt;

  /// Create a copy of StockItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StockItemImplCopyWith<_$StockItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
