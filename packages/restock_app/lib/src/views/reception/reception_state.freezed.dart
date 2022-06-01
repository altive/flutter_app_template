// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reception_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReceptionState {
// 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReceptionStateCopyWith<ReceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceptionStateCopyWith<$Res> {
  factory $ReceptionStateCopyWith(
          ReceptionState value, $Res Function(ReceptionState) then) =
      _$ReceptionStateCopyWithImpl<$Res>;
  $Res call({bool loading});
}

/// @nodoc
class _$ReceptionStateCopyWithImpl<$Res>
    implements $ReceptionStateCopyWith<$Res> {
  _$ReceptionStateCopyWithImpl(this._value, this._then);

  final ReceptionState _value;
  // ignore: unused_field
  final $Res Function(ReceptionState) _then;

  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ReceptionStateCopyWith<$Res>
    implements $ReceptionStateCopyWith<$Res> {
  factory _$$_ReceptionStateCopyWith(
          _$_ReceptionState value, $Res Function(_$_ReceptionState) then) =
      __$$_ReceptionStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading});
}

/// @nodoc
class __$$_ReceptionStateCopyWithImpl<$Res>
    extends _$ReceptionStateCopyWithImpl<$Res>
    implements _$$_ReceptionStateCopyWith<$Res> {
  __$$_ReceptionStateCopyWithImpl(
      _$_ReceptionState _value, $Res Function(_$_ReceptionState) _then)
      : super(_value, (v) => _then(v as _$_ReceptionState));

  @override
  _$_ReceptionState get _value => super._value as _$_ReceptionState;

  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_$_ReceptionState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReceptionState implements _ReceptionState {
  const _$_ReceptionState({this.loading = false});

// 読み込み中かどうか
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'ReceptionState(loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceptionState &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$$_ReceptionStateCopyWith<_$_ReceptionState> get copyWith =>
      __$$_ReceptionStateCopyWithImpl<_$_ReceptionState>(this, _$identity);
}

abstract class _ReceptionState implements ReceptionState {
  const factory _ReceptionState({final bool loading}) = _$_ReceptionState;

  @override // 読み込み中かどうか
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReceptionStateCopyWith<_$_ReceptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
