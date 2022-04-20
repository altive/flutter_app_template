// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckerState {
// 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  int get manCount => throw _privateConstructorUsedError;
  int get womanCount => throw _privateConstructorUsedError;
  int get childCount => throw _privateConstructorUsedError;
  List<RecommendStockSet>? get stockSetList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckerStateCopyWith<CheckerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckerStateCopyWith<$Res> {
  factory $CheckerStateCopyWith(
          CheckerState value, $Res Function(CheckerState) then) =
      _$CheckerStateCopyWithImpl<$Res>;
  $Res call(
      {bool loading,
      int manCount,
      int womanCount,
      int childCount,
      List<RecommendStockSet>? stockSetList});
}

/// @nodoc
class _$CheckerStateCopyWithImpl<$Res> implements $CheckerStateCopyWith<$Res> {
  _$CheckerStateCopyWithImpl(this._value, this._then);

  final CheckerState _value;
  // ignore: unused_field
  final $Res Function(CheckerState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? manCount = freezed,
    Object? womanCount = freezed,
    Object? childCount = freezed,
    Object? stockSetList = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      manCount: manCount == freezed
          ? _value.manCount
          : manCount // ignore: cast_nullable_to_non_nullable
              as int,
      womanCount: womanCount == freezed
          ? _value.womanCount
          : womanCount // ignore: cast_nullable_to_non_nullable
              as int,
      childCount: childCount == freezed
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockSetList: stockSetList == freezed
          ? _value.stockSetList
          : stockSetList // ignore: cast_nullable_to_non_nullable
              as List<RecommendStockSet>?,
    ));
  }
}

/// @nodoc
abstract class _$CheckerStateCopyWith<$Res>
    implements $CheckerStateCopyWith<$Res> {
  factory _$CheckerStateCopyWith(
          _CheckerState value, $Res Function(_CheckerState) then) =
      __$CheckerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      int manCount,
      int womanCount,
      int childCount,
      List<RecommendStockSet>? stockSetList});
}

/// @nodoc
class __$CheckerStateCopyWithImpl<$Res> extends _$CheckerStateCopyWithImpl<$Res>
    implements _$CheckerStateCopyWith<$Res> {
  __$CheckerStateCopyWithImpl(
      _CheckerState _value, $Res Function(_CheckerState) _then)
      : super(_value, (v) => _then(v as _CheckerState));

  @override
  _CheckerState get _value => super._value as _CheckerState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? manCount = freezed,
    Object? womanCount = freezed,
    Object? childCount = freezed,
    Object? stockSetList = freezed,
  }) {
    return _then(_CheckerState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      manCount: manCount == freezed
          ? _value.manCount
          : manCount // ignore: cast_nullable_to_non_nullable
              as int,
      womanCount: womanCount == freezed
          ? _value.womanCount
          : womanCount // ignore: cast_nullable_to_non_nullable
              as int,
      childCount: childCount == freezed
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
      stockSetList: stockSetList == freezed
          ? _value.stockSetList
          : stockSetList // ignore: cast_nullable_to_non_nullable
              as List<RecommendStockSet>?,
    ));
  }
}

/// @nodoc

class _$_CheckerState implements _CheckerState {
  const _$_CheckerState(
      {this.loading = false,
      this.manCount = 0,
      this.womanCount = 0,
      this.childCount = 0,
      this.stockSetList});

// 読み込み中かどうか
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final int manCount;
  @override
  @JsonKey()
  final int womanCount;
  @override
  @JsonKey()
  final int childCount;
  @override
  final List<RecommendStockSet>? stockSetList;

  @override
  String toString() {
    return 'CheckerState(loading: $loading, manCount: $manCount, womanCount: $womanCount, childCount: $childCount, stockSetList: $stockSetList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CheckerState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.manCount, manCount) &&
            const DeepCollectionEquality()
                .equals(other.womanCount, womanCount) &&
            const DeepCollectionEquality()
                .equals(other.childCount, childCount) &&
            const DeepCollectionEquality()
                .equals(other.stockSetList, stockSetList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(manCount),
      const DeepCollectionEquality().hash(womanCount),
      const DeepCollectionEquality().hash(childCount),
      const DeepCollectionEquality().hash(stockSetList));

  @JsonKey(ignore: true)
  @override
  _$CheckerStateCopyWith<_CheckerState> get copyWith =>
      __$CheckerStateCopyWithImpl<_CheckerState>(this, _$identity);
}

abstract class _CheckerState implements CheckerState {
  const factory _CheckerState(
      {final bool loading,
      final int manCount,
      final int womanCount,
      final int childCount,
      final List<RecommendStockSet>? stockSetList}) = _$_CheckerState;

  @override // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  @override
  int get manCount => throw _privateConstructorUsedError;
  @override
  int get womanCount => throw _privateConstructorUsedError;
  @override
  int get childCount => throw _privateConstructorUsedError;
  @override
  List<RecommendStockSet>? get stockSetList =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CheckerStateCopyWith<_CheckerState> get copyWith =>
      throw _privateConstructorUsedError;
}
