// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserRequestStateTearOff {
  const _$UserRequestStateTearOff();

  _UserRequestState call({bool sending = false}) {
    return _UserRequestState(
      sending: sending,
    );
  }
}

/// @nodoc
const $UserRequestState = _$UserRequestStateTearOff();

/// @nodoc
mixin _$UserRequestState {
//
  bool get sending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRequestStateCopyWith<UserRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestStateCopyWith<$Res> {
  factory $UserRequestStateCopyWith(
          UserRequestState value, $Res Function(UserRequestState) then) =
      _$UserRequestStateCopyWithImpl<$Res>;
  $Res call({bool sending});
}

/// @nodoc
class _$UserRequestStateCopyWithImpl<$Res>
    implements $UserRequestStateCopyWith<$Res> {
  _$UserRequestStateCopyWithImpl(this._value, this._then);

  final UserRequestState _value;
  // ignore: unused_field
  final $Res Function(UserRequestState) _then;

  @override
  $Res call({
    Object? sending = freezed,
  }) {
    return _then(_value.copyWith(
      sending: sending == freezed
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserRequestStateCopyWith<$Res>
    implements $UserRequestStateCopyWith<$Res> {
  factory _$UserRequestStateCopyWith(
          _UserRequestState value, $Res Function(_UserRequestState) then) =
      __$UserRequestStateCopyWithImpl<$Res>;
  @override
  $Res call({bool sending});
}

/// @nodoc
class __$UserRequestStateCopyWithImpl<$Res>
    extends _$UserRequestStateCopyWithImpl<$Res>
    implements _$UserRequestStateCopyWith<$Res> {
  __$UserRequestStateCopyWithImpl(
      _UserRequestState _value, $Res Function(_UserRequestState) _then)
      : super(_value, (v) => _then(v as _UserRequestState));

  @override
  _UserRequestState get _value => super._value as _UserRequestState;

  @override
  $Res call({
    Object? sending = freezed,
  }) {
    return _then(_UserRequestState(
      sending: sending == freezed
          ? _value.sending
          : sending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserRequestState implements _UserRequestState {
  const _$_UserRequestState({this.sending = false});

  @JsonKey(defaultValue: false)
  @override //
  final bool sending;

  @override
  String toString() {
    return 'UserRequestState(sending: $sending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserRequestState &&
            (identical(other.sending, sending) ||
                const DeepCollectionEquality().equals(other.sending, sending)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(sending);

  @JsonKey(ignore: true)
  @override
  _$UserRequestStateCopyWith<_UserRequestState> get copyWith =>
      __$UserRequestStateCopyWithImpl<_UserRequestState>(this, _$identity);
}

abstract class _UserRequestState implements UserRequestState {
  const factory _UserRequestState({bool sending}) = _$_UserRequestState;

  @override //
  bool get sending => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserRequestStateCopyWith<_UserRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}
