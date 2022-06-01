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
abstract class _$$_CheckerStateCopyWith<$Res>
    implements $CheckerStateCopyWith<$Res> {
  factory _$$_CheckerStateCopyWith(
          _$_CheckerState value, $Res Function(_$_CheckerState) then) =
      __$$_CheckerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool loading,
      int manCount,
      int womanCount,
      int childCount,
      List<RecommendStockSet>? stockSetList});
}

/// @nodoc
class __$$_CheckerStateCopyWithImpl<$Res>
    extends _$CheckerStateCopyWithImpl<$Res>
    implements _$$_CheckerStateCopyWith<$Res> {
  __$$_CheckerStateCopyWithImpl(
      _$_CheckerState _value, $Res Function(_$_CheckerState) _then)
      : super(_value, (v) => _then(v as _$_CheckerState));

  @override
  _$_CheckerState get _value => super._value as _$_CheckerState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? manCount = freezed,
    Object? womanCount = freezed,
    Object? childCount = freezed,
    Object? stockSetList = freezed,
  }) {
    return _then(_$_CheckerState(
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
          ? _value._stockSetList
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
      final List<RecommendStockSet>? stockSetList})
      : _stockSetList = stockSetList;

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
  final List<RecommendStockSet>? _stockSetList;
  @override
  List<RecommendStockSet>? get stockSetList {
    final value = _stockSetList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CheckerState(loading: $loading, manCount: $manCount, womanCount: $womanCount, childCount: $childCount, stockSetList: $stockSetList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckerState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality().equals(other.manCount, manCount) &&
            const DeepCollectionEquality()
                .equals(other.womanCount, womanCount) &&
            const DeepCollectionEquality()
                .equals(other.childCount, childCount) &&
            const DeepCollectionEquality()
                .equals(other._stockSetList, _stockSetList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(manCount),
      const DeepCollectionEquality().hash(womanCount),
      const DeepCollectionEquality().hash(childCount),
      const DeepCollectionEquality().hash(_stockSetList));

  @JsonKey(ignore: true)
  @override
  _$$_CheckerStateCopyWith<_$_CheckerState> get copyWith =>
      __$$_CheckerStateCopyWithImpl<_$_CheckerState>(this, _$identity);
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
  _$$_CheckerStateCopyWith<_$_CheckerState> get copyWith =>
      throw _privateConstructorUsedError;
}
