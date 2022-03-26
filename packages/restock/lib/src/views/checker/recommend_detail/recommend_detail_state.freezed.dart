// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recommend_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecommendDetailStateTearOff {
  const _$RecommendDetailStateTearOff();

  _RecommendDetailState call(
      {bool fetching = true, PaapiGetItemsResult? itemResult}) {
    return _RecommendDetailState(
      fetching: fetching,
      itemResult: itemResult,
    );
  }
}

/// @nodoc
const $RecommendDetailState = _$RecommendDetailStateTearOff();

/// @nodoc
mixin _$RecommendDetailState {
// ローディング中かどうか
  bool get fetching => throw _privateConstructorUsedError; // 商品検索結果
  PaapiGetItemsResult? get itemResult => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecommendDetailStateCopyWith<RecommendDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendDetailStateCopyWith<$Res> {
  factory $RecommendDetailStateCopyWith(RecommendDetailState value,
          $Res Function(RecommendDetailState) then) =
      _$RecommendDetailStateCopyWithImpl<$Res>;
  $Res call({bool fetching, PaapiGetItemsResult? itemResult});
}

/// @nodoc
class _$RecommendDetailStateCopyWithImpl<$Res>
    implements $RecommendDetailStateCopyWith<$Res> {
  _$RecommendDetailStateCopyWithImpl(this._value, this._then);

  final RecommendDetailState _value;
  // ignore: unused_field
  final $Res Function(RecommendDetailState) _then;

  @override
  $Res call({
    Object? fetching = freezed,
    Object? itemResult = freezed,
  }) {
    return _then(_value.copyWith(
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      itemResult: itemResult == freezed
          ? _value.itemResult
          : itemResult // ignore: cast_nullable_to_non_nullable
              as PaapiGetItemsResult?,
    ));
  }
}

/// @nodoc
abstract class _$RecommendDetailStateCopyWith<$Res>
    implements $RecommendDetailStateCopyWith<$Res> {
  factory _$RecommendDetailStateCopyWith(_RecommendDetailState value,
          $Res Function(_RecommendDetailState) then) =
      __$RecommendDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({bool fetching, PaapiGetItemsResult? itemResult});
}

/// @nodoc
class __$RecommendDetailStateCopyWithImpl<$Res>
    extends _$RecommendDetailStateCopyWithImpl<$Res>
    implements _$RecommendDetailStateCopyWith<$Res> {
  __$RecommendDetailStateCopyWithImpl(
      _RecommendDetailState _value, $Res Function(_RecommendDetailState) _then)
      : super(_value, (v) => _then(v as _RecommendDetailState));

  @override
  _RecommendDetailState get _value => super._value as _RecommendDetailState;

  @override
  $Res call({
    Object? fetching = freezed,
    Object? itemResult = freezed,
  }) {
    return _then(_RecommendDetailState(
      fetching: fetching == freezed
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      itemResult: itemResult == freezed
          ? _value.itemResult
          : itemResult // ignore: cast_nullable_to_non_nullable
              as PaapiGetItemsResult?,
    ));
  }
}

/// @nodoc

class _$_RecommendDetailState implements _RecommendDetailState {
  const _$_RecommendDetailState({this.fetching = true, this.itemResult});

  @JsonKey(defaultValue: true)
  @override // ローディング中かどうか
  final bool fetching;
  @override // 商品検索結果
  final PaapiGetItemsResult? itemResult;

  @override
  String toString() {
    return 'RecommendDetailState(fetching: $fetching, itemResult: $itemResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecommendDetailState &&
            (identical(other.fetching, fetching) ||
                const DeepCollectionEquality()
                    .equals(other.fetching, fetching)) &&
            (identical(other.itemResult, itemResult) ||
                const DeepCollectionEquality()
                    .equals(other.itemResult, itemResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(fetching) ^
      const DeepCollectionEquality().hash(itemResult);

  @JsonKey(ignore: true)
  @override
  _$RecommendDetailStateCopyWith<_RecommendDetailState> get copyWith =>
      __$RecommendDetailStateCopyWithImpl<_RecommendDetailState>(
          this, _$identity);
}

abstract class _RecommendDetailState implements RecommendDetailState {
  const factory _RecommendDetailState(
      {bool fetching,
      PaapiGetItemsResult? itemResult}) = _$_RecommendDetailState;

  @override // ローディング中かどうか
  bool get fetching => throw _privateConstructorUsedError;
  @override // 商品検索結果
  PaapiGetItemsResult? get itemResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecommendDetailStateCopyWith<_RecommendDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
