// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimelineStateTearOff {
  const _$TimelineStateTearOff();

  _TimelineState call(
      {bool loading = false,
      List<EveryonesStockModel> displayItems = const <EveryonesStockModel>[]}) {
    return _TimelineState(
      loading: loading,
      displayItems: displayItems,
    );
  }
}

/// @nodoc
const $TimelineState = _$TimelineStateTearOff();

/// @nodoc
mixin _$TimelineState {
// 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError; // 表示しているアイテムリスト
  List<EveryonesStockModel> get displayItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res>;
  $Res call({bool loading, List<EveryonesStockModel> displayItems});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  final TimelineState _value;
  // ignore: unused_field
  final $Res Function(TimelineState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? displayItems = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItems: displayItems == freezed
          ? _value.displayItems
          : displayItems // ignore: cast_nullable_to_non_nullable
              as List<EveryonesStockModel>,
    ));
  }
}

/// @nodoc
abstract class _$TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$TimelineStateCopyWith(
          _TimelineState value, $Res Function(_TimelineState) then) =
      __$TimelineStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, List<EveryonesStockModel> displayItems});
}

/// @nodoc
class __$TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res>
    implements _$TimelineStateCopyWith<$Res> {
  __$TimelineStateCopyWithImpl(
      _TimelineState _value, $Res Function(_TimelineState) _then)
      : super(_value, (v) => _then(v as _TimelineState));

  @override
  _TimelineState get _value => super._value as _TimelineState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? displayItems = freezed,
  }) {
    return _then(_TimelineState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItems: displayItems == freezed
          ? _value.displayItems
          : displayItems // ignore: cast_nullable_to_non_nullable
              as List<EveryonesStockModel>,
    ));
  }
}

/// @nodoc

class _$_TimelineState with DiagnosticableTreeMixin implements _TimelineState {
  const _$_TimelineState(
      {this.loading = false,
      this.displayItems = const <EveryonesStockModel>[]});

  @JsonKey(defaultValue: false)
  @override // 読み込み中かどうか
  final bool loading;
  @JsonKey(defaultValue: const <EveryonesStockModel>[])
  @override // 表示しているアイテムリスト
  final List<EveryonesStockModel> displayItems;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimelineState(loading: $loading, displayItems: $displayItems)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimelineState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('displayItems', displayItems));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimelineState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.displayItems, displayItems) ||
                const DeepCollectionEquality()
                    .equals(other.displayItems, displayItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(displayItems);

  @JsonKey(ignore: true)
  @override
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      __$TimelineStateCopyWithImpl<_TimelineState>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  const factory _TimelineState(
      {bool loading,
      List<EveryonesStockModel> displayItems}) = _$_TimelineState;

  @override // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  @override // 表示しているアイテムリスト
  List<EveryonesStockModel> get displayItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
