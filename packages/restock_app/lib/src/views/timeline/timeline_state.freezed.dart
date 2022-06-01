// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$$_TimelineStateCopyWith(
          _$_TimelineState value, $Res Function(_$_TimelineState) then) =
      __$$_TimelineStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading, List<EveryonesStockModel> displayItems});
}

/// @nodoc
class __$$_TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res>
    implements _$$_TimelineStateCopyWith<$Res> {
  __$$_TimelineStateCopyWithImpl(
      _$_TimelineState _value, $Res Function(_$_TimelineState) _then)
      : super(_value, (v) => _then(v as _$_TimelineState));

  @override
  _$_TimelineState get _value => super._value as _$_TimelineState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? displayItems = freezed,
  }) {
    return _then(_$_TimelineState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItems: displayItems == freezed
          ? _value._displayItems
          : displayItems // ignore: cast_nullable_to_non_nullable
              as List<EveryonesStockModel>,
    ));
  }
}

/// @nodoc

class _$_TimelineState with DiagnosticableTreeMixin implements _TimelineState {
  const _$_TimelineState(
      {this.loading = false,
      final List<EveryonesStockModel> displayItems =
          const <EveryonesStockModel>[]})
      : _displayItems = displayItems;

// 読み込み中かどうか
  @override
  @JsonKey()
  final bool loading;
// 表示しているアイテムリスト
  final List<EveryonesStockModel> _displayItems;
// 表示しているアイテムリスト
  @override
  @JsonKey()
  List<EveryonesStockModel> get displayItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayItems);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_TimelineState &&
            const DeepCollectionEquality().equals(other.loading, loading) &&
            const DeepCollectionEquality()
                .equals(other._displayItems, _displayItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(loading),
      const DeepCollectionEquality().hash(_displayItems));

  @JsonKey(ignore: true)
  @override
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      __$$_TimelineStateCopyWithImpl<_$_TimelineState>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  const factory _TimelineState(
      {final bool loading,
      final List<EveryonesStockModel> displayItems}) = _$_TimelineState;

  @override // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  @override // 表示しているアイテムリスト
  List<EveryonesStockModel> get displayItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TimelineStateCopyWith<_$_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
