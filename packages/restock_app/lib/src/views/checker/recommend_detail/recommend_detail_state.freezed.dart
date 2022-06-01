// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recommend_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_RecommendDetailStateCopyWith<$Res>
    implements $RecommendDetailStateCopyWith<$Res> {
  factory _$$_RecommendDetailStateCopyWith(_$_RecommendDetailState value,
          $Res Function(_$_RecommendDetailState) then) =
      __$$_RecommendDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({bool fetching, PaapiGetItemsResult? itemResult});
}

/// @nodoc
class __$$_RecommendDetailStateCopyWithImpl<$Res>
    extends _$RecommendDetailStateCopyWithImpl<$Res>
    implements _$$_RecommendDetailStateCopyWith<$Res> {
  __$$_RecommendDetailStateCopyWithImpl(_$_RecommendDetailState _value,
      $Res Function(_$_RecommendDetailState) _then)
      : super(_value, (v) => _then(v as _$_RecommendDetailState));

  @override
  _$_RecommendDetailState get _value => super._value as _$_RecommendDetailState;

  @override
  $Res call({
    Object? fetching = freezed,
    Object? itemResult = freezed,
  }) {
    return _then(_$_RecommendDetailState(
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

// ローディング中かどうか
  @override
  @JsonKey()
  final bool fetching;
// 商品検索結果
  @override
  final PaapiGetItemsResult? itemResult;

  @override
  String toString() {
    return 'RecommendDetailState(fetching: $fetching, itemResult: $itemResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendDetailState &&
            const DeepCollectionEquality().equals(other.fetching, fetching) &&
            const DeepCollectionEquality()
                .equals(other.itemResult, itemResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fetching),
      const DeepCollectionEquality().hash(itemResult));

  @JsonKey(ignore: true)
  @override
  _$$_RecommendDetailStateCopyWith<_$_RecommendDetailState> get copyWith =>
      __$$_RecommendDetailStateCopyWithImpl<_$_RecommendDetailState>(
          this, _$identity);
}

abstract class _RecommendDetailState implements RecommendDetailState {
  const factory _RecommendDetailState(
      {final bool fetching,
      final PaapiGetItemsResult? itemResult}) = _$_RecommendDetailState;

  @override // ローディング中かどうか
  bool get fetching => throw _privateConstructorUsedError;
  @override // 商品検索結果
  PaapiGetItemsResult? get itemResult => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendDetailStateCopyWith<_$_RecommendDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
