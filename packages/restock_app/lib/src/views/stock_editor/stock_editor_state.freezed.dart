// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_editor_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StockEditorStateTearOff {
  const _$StockEditorStateTearOff();

  _StockEditorState call(
      {bool hasChanged = false,
      bool loading = false,
      String itemName = '',
      int numberOfItems = 1,
      ExpirationDateType expirationDateType = ExpirationDateType.bestBefore,
      DateTime? expirationDate,
      String? amazonUrl,
      String? imageUrl,
      @JsonKey(name: 'category')
          MyStockCategory productCategory = MyStockCategory.grocery,
      String? memo,
      bool isNotificationEnabled = false,
      @JsonKey(name: 'place')
          String? stockCategory}) {
    return _StockEditorState(
      hasChanged: hasChanged,
      loading: loading,
      itemName: itemName,
      numberOfItems: numberOfItems,
      expirationDateType: expirationDateType,
      expirationDate: expirationDate,
      amazonUrl: amazonUrl,
      imageUrl: imageUrl,
      productCategory: productCategory,
      memo: memo,
      isNotificationEnabled: isNotificationEnabled,
      stockCategory: stockCategory,
    );
  }
}

/// @nodoc
const $StockEditorState = _$StockEditorStateTearOff();

/// @nodoc
mixin _$StockEditorState {
// 編集されたかどうか
  bool get hasChanged => throw _privateConstructorUsedError; // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError; // アイテムの名前
  String get itemName => throw _privateConstructorUsedError; // アイテムの個数
  int get numberOfItems => throw _privateConstructorUsedError; // 期限の種類
  ExpirationDateType get expirationDateType =>
      throw _privateConstructorUsedError; // 期限の日付
  DateTime? get expirationDate =>
      throw _privateConstructorUsedError; // アマゾンの商品URL@nullable
  String? get amazonUrl => throw _privateConstructorUsedError; // 商品画像（大）
  String? get imageUrl => throw _privateConstructorUsedError; // アイテムのジャンル
  @JsonKey(name: 'category')
  MyStockCategory get productCategory =>
      throw _privateConstructorUsedError; // メモ@nullable
  String? get memo => throw _privateConstructorUsedError; // 通知するか
  bool get isNotificationEnabled =>
      throw _privateConstructorUsedError; // グループ@nullable
  @JsonKey(name: 'place')
  String? get stockCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockEditorStateCopyWith<StockEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEditorStateCopyWith<$Res> {
  factory $StockEditorStateCopyWith(
          StockEditorState value, $Res Function(StockEditorState) then) =
      _$StockEditorStateCopyWithImpl<$Res>;
  $Res call(
      {bool hasChanged,
      bool loading,
      String itemName,
      int numberOfItems,
      ExpirationDateType expirationDateType,
      DateTime? expirationDate,
      String? amazonUrl,
      String? imageUrl,
      @JsonKey(name: 'category') MyStockCategory productCategory,
      String? memo,
      bool isNotificationEnabled,
      @JsonKey(name: 'place') String? stockCategory});
}

/// @nodoc
class _$StockEditorStateCopyWithImpl<$Res>
    implements $StockEditorStateCopyWith<$Res> {
  _$StockEditorStateCopyWithImpl(this._value, this._then);

  final StockEditorState _value;
  // ignore: unused_field
  final $Res Function(StockEditorState) _then;

  @override
  $Res call({
    Object? hasChanged = freezed,
    Object? loading = freezed,
    Object? itemName = freezed,
    Object? numberOfItems = freezed,
    Object? expirationDateType = freezed,
    Object? expirationDate = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrl = freezed,
    Object? productCategory = freezed,
    Object? memo = freezed,
    Object? isNotificationEnabled = freezed,
    Object? stockCategory = freezed,
  }) {
    return _then(_value.copyWith(
      hasChanged: hasChanged == freezed
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      expirationDateType: expirationDateType == freezed
          ? _value.expirationDateType
          : expirationDateType // ignore: cast_nullable_to_non_nullable
              as ExpirationDateType,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amazonUrl: amazonUrl == freezed
          ? _value.amazonUrl
          : amazonUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: productCategory == freezed
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as MyStockCategory,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotificationEnabled: isNotificationEnabled == freezed
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      stockCategory: stockCategory == freezed
          ? _value.stockCategory
          : stockCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$StockEditorStateCopyWith<$Res>
    implements $StockEditorStateCopyWith<$Res> {
  factory _$StockEditorStateCopyWith(
          _StockEditorState value, $Res Function(_StockEditorState) then) =
      __$StockEditorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool hasChanged,
      bool loading,
      String itemName,
      int numberOfItems,
      ExpirationDateType expirationDateType,
      DateTime? expirationDate,
      String? amazonUrl,
      String? imageUrl,
      @JsonKey(name: 'category') MyStockCategory productCategory,
      String? memo,
      bool isNotificationEnabled,
      @JsonKey(name: 'place') String? stockCategory});
}

/// @nodoc
class __$StockEditorStateCopyWithImpl<$Res>
    extends _$StockEditorStateCopyWithImpl<$Res>
    implements _$StockEditorStateCopyWith<$Res> {
  __$StockEditorStateCopyWithImpl(
      _StockEditorState _value, $Res Function(_StockEditorState) _then)
      : super(_value, (v) => _then(v as _StockEditorState));

  @override
  _StockEditorState get _value => super._value as _StockEditorState;

  @override
  $Res call({
    Object? hasChanged = freezed,
    Object? loading = freezed,
    Object? itemName = freezed,
    Object? numberOfItems = freezed,
    Object? expirationDateType = freezed,
    Object? expirationDate = freezed,
    Object? amazonUrl = freezed,
    Object? imageUrl = freezed,
    Object? productCategory = freezed,
    Object? memo = freezed,
    Object? isNotificationEnabled = freezed,
    Object? stockCategory = freezed,
  }) {
    return _then(_StockEditorState(
      hasChanged: hasChanged == freezed
          ? _value.hasChanged
          : hasChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      numberOfItems: numberOfItems == freezed
          ? _value.numberOfItems
          : numberOfItems // ignore: cast_nullable_to_non_nullable
              as int,
      expirationDateType: expirationDateType == freezed
          ? _value.expirationDateType
          : expirationDateType // ignore: cast_nullable_to_non_nullable
              as ExpirationDateType,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amazonUrl: amazonUrl == freezed
          ? _value.amazonUrl
          : amazonUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategory: productCategory == freezed
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as MyStockCategory,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotificationEnabled: isNotificationEnabled == freezed
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      stockCategory: stockCategory == freezed
          ? _value.stockCategory
          : stockCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_StockEditorState implements _StockEditorState {
  const _$_StockEditorState(
      {this.hasChanged = false,
      this.loading = false,
      this.itemName = '',
      this.numberOfItems = 1,
      this.expirationDateType = ExpirationDateType.bestBefore,
      this.expirationDate,
      this.amazonUrl,
      this.imageUrl,
      @JsonKey(name: 'category') this.productCategory = MyStockCategory.grocery,
      this.memo,
      this.isNotificationEnabled = false,
      @JsonKey(name: 'place') this.stockCategory});

  @JsonKey(defaultValue: false)
  @override // 編集されたかどうか
  final bool hasChanged;
  @JsonKey(defaultValue: false)
  @override // 読み込み中かどうか
  final bool loading;
  @JsonKey(defaultValue: '')
  @override // アイテムの名前
  final String itemName;
  @JsonKey(defaultValue: 1)
  @override // アイテムの個数
  final int numberOfItems;
  @JsonKey(defaultValue: ExpirationDateType.bestBefore)
  @override // 期限の種類
  final ExpirationDateType expirationDateType;
  @override // 期限の日付
  final DateTime? expirationDate;
  @override // アマゾンの商品URL@nullable
  final String? amazonUrl;
  @override // 商品画像（大）
  final String? imageUrl;
  @override // アイテムのジャンル
  @JsonKey(name: 'category')
  final MyStockCategory productCategory;
  @override // メモ@nullable
  final String? memo;
  @JsonKey(defaultValue: false)
  @override // 通知するか
  final bool isNotificationEnabled;
  @override // グループ@nullable
  @JsonKey(name: 'place')
  final String? stockCategory;

  @override
  String toString() {
    return 'StockEditorState(hasChanged: $hasChanged, loading: $loading, itemName: $itemName, numberOfItems: $numberOfItems, expirationDateType: $expirationDateType, expirationDate: $expirationDate, amazonUrl: $amazonUrl, imageUrl: $imageUrl, productCategory: $productCategory, memo: $memo, isNotificationEnabled: $isNotificationEnabled, stockCategory: $stockCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _StockEditorState &&
            (identical(other.hasChanged, hasChanged) ||
                const DeepCollectionEquality()
                    .equals(other.hasChanged, hasChanged)) &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.numberOfItems, numberOfItems) ||
                const DeepCollectionEquality()
                    .equals(other.numberOfItems, numberOfItems)) &&
            (identical(other.expirationDateType, expirationDateType) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDateType, expirationDateType)) &&
            (identical(other.expirationDate, expirationDate) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDate, expirationDate)) &&
            (identical(other.amazonUrl, amazonUrl) ||
                const DeepCollectionEquality()
                    .equals(other.amazonUrl, amazonUrl)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.productCategory, productCategory) ||
                const DeepCollectionEquality()
                    .equals(other.productCategory, productCategory)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                const DeepCollectionEquality().equals(
                    other.isNotificationEnabled, isNotificationEnabled)) &&
            (identical(other.stockCategory, stockCategory) ||
                const DeepCollectionEquality()
                    .equals(other.stockCategory, stockCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(hasChanged) ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(numberOfItems) ^
      const DeepCollectionEquality().hash(expirationDateType) ^
      const DeepCollectionEquality().hash(expirationDate) ^
      const DeepCollectionEquality().hash(amazonUrl) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(productCategory) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(isNotificationEnabled) ^
      const DeepCollectionEquality().hash(stockCategory);

  @JsonKey(ignore: true)
  @override
  _$StockEditorStateCopyWith<_StockEditorState> get copyWith =>
      __$StockEditorStateCopyWithImpl<_StockEditorState>(this, _$identity);
}

abstract class _StockEditorState implements StockEditorState {
  const factory _StockEditorState(
      {bool hasChanged,
      bool loading,
      String itemName,
      int numberOfItems,
      ExpirationDateType expirationDateType,
      DateTime? expirationDate,
      String? amazonUrl,
      String? imageUrl,
      @JsonKey(name: 'category') MyStockCategory productCategory,
      String? memo,
      bool isNotificationEnabled,
      @JsonKey(name: 'place') String? stockCategory}) = _$_StockEditorState;

  @override // 編集されたかどうか
  bool get hasChanged => throw _privateConstructorUsedError;
  @override // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  @override // アイテムの名前
  String get itemName => throw _privateConstructorUsedError;
  @override // アイテムの個数
  int get numberOfItems => throw _privateConstructorUsedError;
  @override // 期限の種類
  ExpirationDateType get expirationDateType =>
      throw _privateConstructorUsedError;
  @override // 期限の日付
  DateTime? get expirationDate => throw _privateConstructorUsedError;
  @override // アマゾンの商品URL@nullable
  String? get amazonUrl => throw _privateConstructorUsedError;
  @override // 商品画像（大）
  String? get imageUrl => throw _privateConstructorUsedError;
  @override // アイテムのジャンル
  @JsonKey(name: 'category')
  MyStockCategory get productCategory => throw _privateConstructorUsedError;
  @override // メモ@nullable
  String? get memo => throw _privateConstructorUsedError;
  @override // 通知するか
  bool get isNotificationEnabled => throw _privateConstructorUsedError;
  @override // グループ@nullable
  @JsonKey(name: 'place')
  String? get stockCategory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StockEditorStateCopyWith<_StockEditorState> get copyWith =>
      throw _privateConstructorUsedError;
}
