// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_entrance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_SearchEntranceStateCopyWith<$Res>
    implements $SearchEntranceStateCopyWith<$Res> {
  factory _$$_SearchEntranceStateCopyWith(_$_SearchEntranceState value,
          $Res Function(_$_SearchEntranceState) then) =
      __$$_SearchEntranceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String searchText,
      SearchItemsCategory searchItemsCategory,
      List<PaapiSearchItem>? recommendProducts});
}

/// @nodoc
class __$$_SearchEntranceStateCopyWithImpl<$Res>
    extends _$SearchEntranceStateCopyWithImpl<$Res>
    implements _$$_SearchEntranceStateCopyWith<$Res> {
  __$$_SearchEntranceStateCopyWithImpl(_$_SearchEntranceState _value,
      $Res Function(_$_SearchEntranceState) _then)
      : super(_value, (v) => _then(v as _$_SearchEntranceState));

  @override
  _$_SearchEntranceState get _value => super._value as _$_SearchEntranceState;

  @override
  $Res call({
    Object? searchText = freezed,
    Object? searchItemsCategory = freezed,
    Object? recommendProducts = freezed,
  }) {
    return _then(_$_SearchEntranceState(
      searchText: searchText == freezed
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      searchItemsCategory: searchItemsCategory == freezed
          ? _value.searchItemsCategory
          : searchItemsCategory // ignore: cast_nullable_to_non_nullable
              as SearchItemsCategory,
      recommendProducts: recommendProducts == freezed
          ? _value._recommendProducts
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
      final List<PaapiSearchItem>? recommendProducts})
      : _recommendProducts = recommendProducts;

// 検索フィールド用文字列
  @override
  @JsonKey()
  final String searchText;
  @override
  @JsonKey()
  final SearchItemsCategory searchItemsCategory;
// ASINによる商品検索の結果
  final List<PaapiSearchItem>? _recommendProducts;
// ASINによる商品検索の結果
  @override
  List<PaapiSearchItem>? get recommendProducts {
    final value = _recommendProducts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchEntranceState(searchText: $searchText, searchItemsCategory: $searchItemsCategory, recommendProducts: $recommendProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchEntranceState &&
            const DeepCollectionEquality()
                .equals(other.searchText, searchText) &&
            const DeepCollectionEquality()
                .equals(other.searchItemsCategory, searchItemsCategory) &&
            const DeepCollectionEquality()
                .equals(other._recommendProducts, _recommendProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(searchText),
      const DeepCollectionEquality().hash(searchItemsCategory),
      const DeepCollectionEquality().hash(_recommendProducts));

  @JsonKey(ignore: true)
  @override
  _$$_SearchEntranceStateCopyWith<_$_SearchEntranceState> get copyWith =>
      __$$_SearchEntranceStateCopyWithImpl<_$_SearchEntranceState>(
          this, _$identity);
}

abstract class _SearchEntranceState implements SearchEntranceState {
  const factory _SearchEntranceState(
      {final String searchText,
      final SearchItemsCategory searchItemsCategory,
      final List<PaapiSearchItem>? recommendProducts}) = _$_SearchEntranceState;

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
  _$$_SearchEntranceStateCopyWith<_$_SearchEntranceState> get copyWith =>
      throw _privateConstructorUsedError;
}
