// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSettingState {
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSettingStateCopyWith<AccountSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSettingStateCopyWith<$Res> {
  factory $AccountSettingStateCopyWith(
          AccountSettingState value, $Res Function(AccountSettingState) then) =
      _$AccountSettingStateCopyWithImpl<$Res>;
  $Res call({bool loading});
}

/// @nodoc
class _$AccountSettingStateCopyWithImpl<$Res>
    implements $AccountSettingStateCopyWith<$Res> {
  _$AccountSettingStateCopyWithImpl(this._value, this._then);

  final AccountSettingState _value;
  // ignore: unused_field
  final $Res Function(AccountSettingState) _then;

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
abstract class _$$_AccountSettingStateCopyWith<$Res>
    implements $AccountSettingStateCopyWith<$Res> {
  factory _$$_AccountSettingStateCopyWith(_$_AccountSettingState value,
          $Res Function(_$_AccountSettingState) then) =
      __$$_AccountSettingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool loading});
}

/// @nodoc
class __$$_AccountSettingStateCopyWithImpl<$Res>
    extends _$AccountSettingStateCopyWithImpl<$Res>
    implements _$$_AccountSettingStateCopyWith<$Res> {
  __$$_AccountSettingStateCopyWithImpl(_$_AccountSettingState _value,
      $Res Function(_$_AccountSettingState) _then)
      : super(_value, (v) => _then(v as _$_AccountSettingState));

  @override
  _$_AccountSettingState get _value => super._value as _$_AccountSettingState;

  @override
  $Res call({
    Object? loading = freezed,
  }) {
    return _then(_$_AccountSettingState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AccountSettingState implements _AccountSettingState {
  const _$_AccountSettingState({this.loading = false});

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'AccountSettingState(loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSettingState &&
            const DeepCollectionEquality().equals(other.loading, loading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(loading));

  @JsonKey(ignore: true)
  @override
  _$$_AccountSettingStateCopyWith<_$_AccountSettingState> get copyWith =>
      __$$_AccountSettingStateCopyWithImpl<_$_AccountSettingState>(
          this, _$identity);
}

abstract class _AccountSettingState implements AccountSettingState {
  const factory _AccountSettingState({final bool loading}) =
      _$_AccountSettingState;

  @override
  bool get loading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSettingStateCopyWith<_$_AccountSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
