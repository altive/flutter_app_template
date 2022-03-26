// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchResultStateTearOff {
  const _$SearchResultStateTearOff();

  _SearchResultState call(
      {bool fetching = true,
      PaapiSearchItemsResult? searchResult,
      PaapiSearchItemsParameters? searchParams}) {
    return _SearchResultState(
      fetching: fetching,
      searchResult: searchResult,
      searchParams: searchParams,
    );
  }
}

/// @nodoc
const $SearchResultState = _$SearchResultStateTearOff();

/// @nodoc
mixin _$SearchResultState {
// ローディング中かどうか
  bool get fetching => throw _privateConstructorUsedError;
  PaapiSearchItemsResult? get searchResult =>
      throw _privateConstructorUsedError;
  PaapiSearchItemsParameters? get searchParams =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchResultStateCopyWith<SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResultStateCopyWith<$Res> {
  factory $SearchResultStateCopyWith(
          SearchResultState value, $Res Function(SearchResultState) then) =
      _$SearchResultStateCopyWithImpl<$Res>;
  $Res call(
      {bool fetching,
      PaapiSearchItemsResult? searchResult,
      PaapiSearchItemsParameters? searchParams});

  $PaapiSearchItemsParametersCopyWith<$Res>? get searchParams;
}

/// @nodoc
class _$SearchResultStateCopyWithImpl<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  _$SearchResultStateCopyWithImpl(this._value, this._then);

  final SearchResultState _value;
  // ignore: unused_field
  final $Res Function(SearchResultState) _then;

  @override
  $Res call({
    Object? fetching = freezed,
    Object? searchResult = freezed,
    Object? searchParams = freezed,
  }) {
    return _then(_value.copyWith(
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as PaapiSearchItemsResult?,
      searchParams: searchParams == freezed
          ? _value.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as PaapiSearchItemsParameters?,
    ));
  }

  @override
  $PaapiSearchItemsParametersCopyWith<$Res>? get searchParams {
    if (_value.searchParams == null) {
      return null;
    }

    return $PaapiSearchItemsParametersCopyWith<$Res>(_value.searchParams!,
        (value) {
      return _then(_value.copyWith(searchParams: value));
    });
  }
}

/// @nodoc
abstract class _$SearchResultStateCopyWith<$Res>
    implements $SearchResultStateCopyWith<$Res> {
  factory _$SearchResultStateCopyWith(
          _SearchResultState value, $Res Function(_SearchResultState) then) =
      __$SearchResultStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool fetching,
      PaapiSearchItemsResult? searchResult,
      PaapiSearchItemsParameters? searchParams});

  @override
  $PaapiSearchItemsParametersCopyWith<$Res>? get searchParams;
}

/// @nodoc
class __$SearchResultStateCopyWithImpl<$Res>
    extends _$SearchResultStateCopyWithImpl<$Res>
    implements _$SearchResultStateCopyWith<$Res> {
  __$SearchResultStateCopyWithImpl(
      _SearchResultState _value, $Res Function(_SearchResultState) _then)
      : super(_value, (v) => _then(v as _SearchResultState));

  @override
  _SearchResultState get _value => super._value as _SearchResultState;

  @override
  $Res call({
    Object? fetching = freezed,
    Object? searchResult = freezed,
    Object? searchParams = freezed,
  }) {
    return _then(_SearchResultState(
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as PaapiSearchItemsResult?,
      searchParams: searchParams == freezed
          ? _value.searchParams
          : searchParams // ignore: cast_nullable_to_non_nullable
              as PaapiSearchItemsParameters?,
    ));
  }
}

/// @nodoc

class _$_SearchResultState implements _SearchResultState {
  const _$_SearchResultState(
      {this.fetching = true, this.searchResult, this.searchParams});

  @JsonKey(defaultValue: true)
  @override // ローディング中かどうか
  final bool fetching;
  @override
  final PaapiSearchItemsResult? searchResult;
  @override
  final PaapiSearchItemsParameters? searchParams;

  @override
  String toString() {
    return 'SearchResultState(fetching: $fetching, searchResult: $searchResult, searchParams: $searchParams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchResultState &&
            (identical(other.fetching, fetching) ||
                const DeepCollectionEquality()
                    .equals(other.fetching, fetching)) &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)) &&
            (identical(other.searchParams, searchParams) ||
                const DeepCollectionEquality()
                    .equals(other.searchParams, searchParams)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fetching) ^
      const DeepCollectionEquality().hash(searchResult) ^
      const DeepCollectionEquality().hash(searchParams);

  @JsonKey(ignore: true)
  @override
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith =>
      __$SearchResultStateCopyWithImpl<_SearchResultState>(this, _$identity);
}

abstract class _SearchResultState implements SearchResultState {
  const factory _SearchResultState(
      {bool fetching,
      PaapiSearchItemsResult? searchResult,
      PaapiSearchItemsParameters? searchParams}) = _$_SearchResultState;

  @override // ローディング中かどうか
  bool get fetching => throw _privateConstructorUsedError;
  @override
  PaapiSearchItemsResult? get searchResult =>
      throw _privateConstructorUsedError;
  @override
  PaapiSearchItemsParameters? get searchParams =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchResultStateCopyWith<_SearchResultState> get copyWith =>
      throw _privateConstructorUsedError;
}
