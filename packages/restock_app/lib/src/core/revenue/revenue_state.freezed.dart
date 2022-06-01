// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'revenue_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RevenueState {
  /// サブスクリプション契約中かどうか default: false
  bool get isSubscriber => throw _privateConstructorUsedError;

  /// 情報更新日時
  String? get updatedDateString => throw _privateConstructorUsedError;

  /// 最新の有効期限日
  String? get latestExpirationDateString => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RevenueStateCopyWith<RevenueState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RevenueStateCopyWith<$Res> {
  factory $RevenueStateCopyWith(
          RevenueState value, $Res Function(RevenueState) then) =
      _$RevenueStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubscriber,
      String? updatedDateString,
      String? latestExpirationDateString});
}

/// @nodoc
class _$RevenueStateCopyWithImpl<$Res> implements $RevenueStateCopyWith<$Res> {
  _$RevenueStateCopyWithImpl(this._value, this._then);

  final RevenueState _value;
  // ignore: unused_field
  final $Res Function(RevenueState) _then;

  @override
  $Res call({
    Object? isSubscriber = freezed,
    Object? updatedDateString = freezed,
    Object? latestExpirationDateString = freezed,
  }) {
    return _then(_value.copyWith(
      isSubscriber: isSubscriber == freezed
          ? _value.isSubscriber
          : isSubscriber // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedDateString: updatedDateString == freezed
          ? _value.updatedDateString
          : updatedDateString // ignore: cast_nullable_to_non_nullable
              as String?,
      latestExpirationDateString: latestExpirationDateString == freezed
          ? _value.latestExpirationDateString
          : latestExpirationDateString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_RevenueStateCopyWith<$Res>
    implements $RevenueStateCopyWith<$Res> {
  factory _$$_RevenueStateCopyWith(
          _$_RevenueState value, $Res Function(_$_RevenueState) then) =
      __$$_RevenueStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubscriber,
      String? updatedDateString,
      String? latestExpirationDateString});
}

/// @nodoc
class __$$_RevenueStateCopyWithImpl<$Res>
    extends _$RevenueStateCopyWithImpl<$Res>
    implements _$$_RevenueStateCopyWith<$Res> {
  __$$_RevenueStateCopyWithImpl(
      _$_RevenueState _value, $Res Function(_$_RevenueState) _then)
      : super(_value, (v) => _then(v as _$_RevenueState));

  @override
  _$_RevenueState get _value => super._value as _$_RevenueState;

  @override
  $Res call({
    Object? isSubscriber = freezed,
    Object? updatedDateString = freezed,
    Object? latestExpirationDateString = freezed,
  }) {
    return _then(_$_RevenueState(
      isSubscriber: isSubscriber == freezed
          ? _value.isSubscriber
          : isSubscriber // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedDateString: updatedDateString == freezed
          ? _value.updatedDateString
          : updatedDateString // ignore: cast_nullable_to_non_nullable
              as String?,
      latestExpirationDateString: latestExpirationDateString == freezed
          ? _value.latestExpirationDateString
          : latestExpirationDateString // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_RevenueState with DiagnosticableTreeMixin implements _RevenueState {
  const _$_RevenueState(
      {this.isSubscriber = false,
      this.updatedDateString,
      this.latestExpirationDateString});

  /// サブスクリプション契約中かどうか default: false
  @override
  @JsonKey()
  final bool isSubscriber;

  /// 情報更新日時
  @override
  final String? updatedDateString;

  /// 最新の有効期限日
  @override
  final String? latestExpirationDateString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RevenueState(isSubscriber: $isSubscriber, updatedDateString: $updatedDateString, latestExpirationDateString: $latestExpirationDateString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RevenueState'))
      ..add(DiagnosticsProperty('isSubscriber', isSubscriber))
      ..add(DiagnosticsProperty('updatedDateString', updatedDateString))
      ..add(DiagnosticsProperty(
          'latestExpirationDateString', latestExpirationDateString));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RevenueState &&
            const DeepCollectionEquality()
                .equals(other.isSubscriber, isSubscriber) &&
            const DeepCollectionEquality()
                .equals(other.updatedDateString, updatedDateString) &&
            const DeepCollectionEquality().equals(
                other.latestExpirationDateString, latestExpirationDateString));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSubscriber),
      const DeepCollectionEquality().hash(updatedDateString),
      const DeepCollectionEquality().hash(latestExpirationDateString));

  @JsonKey(ignore: true)
  @override
  _$$_RevenueStateCopyWith<_$_RevenueState> get copyWith =>
      __$$_RevenueStateCopyWithImpl<_$_RevenueState>(this, _$identity);
}

abstract class _RevenueState implements RevenueState {
  const factory _RevenueState(
      {final bool isSubscriber,
      final String? updatedDateString,
      final String? latestExpirationDateString}) = _$_RevenueState;

  @override

  /// サブスクリプション契約中かどうか default: false
  bool get isSubscriber => throw _privateConstructorUsedError;
  @override

  /// 情報更新日時
  String? get updatedDateString => throw _privateConstructorUsedError;
  @override

  /// 最新の有効期限日
  String? get latestExpirationDateString => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RevenueStateCopyWith<_$_RevenueState> get copyWith =>
      throw _privateConstructorUsedError;
}
