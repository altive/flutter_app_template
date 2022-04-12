// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_entrance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchEntranceStateTearOff {
  const _$SearchEntranceStateTearOff();

  _SearchEntranceState call(
      {String searchText = '',
      SearchItemsCategory searchItemsCategory = SearchItemsCategory.all,
      List<PaapiSearchItem>? recommendProducts}) {
    return _SearchEntranceState(
      searchText: searchText,
      searchItemsCategory: searchItemsCategory,
      recommendProducts: recommendProducts,
    );
  }
}

/// @nodoc
const $SearchEntranceState = _$SearchEntranceStateTearOff();

/// @nodoc
mixin _$SearchEntranceState {
// 検索フィールド用文字列
  String get searchText => throw _privateConstructorUsedError;
  SearchItemsCategory get searchItemsCategory =>
      throw _privateConstructorUsedError; // ASINによる商品検索の結果
  List<PaapiSearchItem>? get recommendProducts =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchEntranceStateCopyWith<SearchEntranceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEntranceStateCopyWith<$Res> {
  factory $SearchEntranceStateCopyWith(
          SearchEntranceState value, $Res Function(SearchEntranceState) then) =
      _$SearchEntranceStateCopyWithImpl<$Res>;
  $Res call(
      {String searchText,
      SearchItemsCategory searchItemsCategory,
      List<PaapiSearchItem>? recommendProducts});
}

/// @nodoc
class _$SearchEntranceStateCopyWithImpl<$Res>
    implements $SearchEntranceStateCopyWith<$Res> {
  _$SearchEntranceStateCopyWithImpl(this._value, this._then);

  final SearchEntranceState _value;
  // ignore: unused_field
  final $Res Function(SearchEntranceState) _then;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? searchItemsCategory = freezed,
    Object? recommendProducts = freezed,
  }) {
    return _then(_value.copyWith(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      searchItemsCategory: searchItemsCategory == freezed
          ? _value.searchItemsCategory
          : searchItemsCategory // ignore: cast_nullable_to_non_nullable
              as SearchItemsCategory,
      recommendProducts: recommendProducts == freezed
          ? _value.recommendProducts
          : recommendProducts // ignore: cast_nullable_to_non_nullable
              as List<PaapiSearchItem>?,
    ));
  }
}

/// @nodoc
abstract class _$SearchEntranceStateCopyWith<$Res>
    implements $SearchEntranceStateCopyWith<$Res> {
  factory _$SearchEntranceStateCopyWith(_SearchEntranceState value,
          $Res Function(_SearchEntranceState) then) =
      __$SearchEntranceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String searchText,
      SearchItemsCategory searchItemsCategory,
      List<PaapiSearchItem>? recommendProducts});
}

/// @nodoc
class __$SearchEntranceStateCopyWithImpl<$Res>
    extends _$SearchEntranceStateCopyWithImpl<$Res>
    implements _$SearchEntranceStateCopyWith<$Res> {
  __$SearchEntranceStateCopyWithImpl(
      _SearchEntranceState _value, $Res Function(_SearchEntranceState) _then)
      : super(_value, (v) => _then(v as _SearchEntranceState));

  @override
  _SearchEntranceState get _value => super._value as _SearchEntranceState;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? searchItemsCategory = freezed,
    Object? recommendProducts = freezed,
  }) {
    return _then(_SearchEntranceState(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      searchItemsCategory: searchItemsCategory == freezed
          ? _value.searchItemsCategory
          : searchItemsCategory // ignore: cast_nullable_to_non_nullable
              as SearchItemsCategory,
      recommendProducts: recommendProducts == freezed
          ? _value.recommendProducts
          : recommendProducts // ignore: cast_nullable_to_non_nullable
              as List<PaapiSearchItem>?,
    ));
  }
}

/// @nodoc

class _$_SearchEntranceState implements _SearchEntranceState {
  const _$_SearchEntranceState(
      {this.searchText = '',
      this.searchItemsCategory = SearchItemsCategory.all,
      this.recommendProducts});

  @JsonKey(defaultValue: '')
  @override // 検索フィールド用文字列
  final String searchText;
  @JsonKey(defaultValue: SearchItemsCategory.all)
  @override
  final SearchItemsCategory searchItemsCategory;
  @override // ASINによる商品検索の結果
  final List<PaapiSearchItem>? recommendProducts;

  @override
  String toString() {
    return 'SearchEntranceState(searchText: $searchText, searchItemsCategory: $searchItemsCategory, recommendProducts: $recommendProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchEntranceState &&
            (identical(other.searchText, searchText) ||
                const DeepCollectionEquality()
                    .equals(other.searchText, searchText)) &&
            (identical(other.searchItemsCategory, searchItemsCategory) ||
                const DeepCollectionEquality()
                    .equals(other.searchItemsCategory, searchItemsCategory)) &&
            (identical(other.recommendProducts, recommendProducts) ||
                const DeepCollectionEquality()
                    .equals(other.recommendProducts, recommendProducts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchText) ^
      const DeepCollectionEquality().hash(searchItemsCategory) ^
      const DeepCollectionEquality().hash(recommendProducts);

  @JsonKey(ignore: true)
  @override
  _$SearchEntranceStateCopyWith<_SearchEntranceState> get copyWith =>
      __$SearchEntranceStateCopyWithImpl<_SearchEntranceState>(
          this, _$identity);
}

abstract class _SearchEntranceState implements SearchEntranceState {
  const factory _SearchEntranceState(
      {String searchText,
      SearchItemsCategory searchItemsCategory,
      List<PaapiSearchItem>? recommendProducts}) = _$_SearchEntranceState;

  @override // 検索フィールド用文字列
  String get searchText => throw _privateConstructorUsedError;
  @override
  SearchItemsCategory get searchItemsCategory =>
      throw _privateConstructorUsedError;
  @override // ASINによる商品検索の結果
  List<PaapiSearchItem>? get recommendProducts =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchEntranceStateCopyWith<_SearchEntranceState> get copyWith =>
      throw _privateConstructorUsedError;
}
