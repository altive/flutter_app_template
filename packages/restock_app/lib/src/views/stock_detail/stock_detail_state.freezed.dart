// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stock_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StockDetailStateTearOff {
  const _$StockDetailStateTearOff();

  _ItemDetailState call(
      {bool isNotificationEnabled = false,
      DateTime? notificationDate,
      int? notificationDurationDays,
      TimeOfDay? notificationTime}) {
    return _ItemDetailState(
      isNotificationEnabled: isNotificationEnabled,
      notificationDate: notificationDate,
      notificationDurationDays: notificationDurationDays,
      notificationTime: notificationTime,
    );
  }
}

/// @nodoc
const $StockDetailState = _$StockDetailStateTearOff();

/// @nodoc
mixin _$StockDetailState {
// 通知のON/OFF
  bool get isNotificationEnabled =>
      throw _privateConstructorUsedError; // 通知する日時
  DateTime? get notificationDate =>
      throw _privateConstructorUsedError; // 何日前に通知するか
  int? get notificationDurationDays =>
      throw _privateConstructorUsedError; // 通知する時刻
  TimeOfDay? get notificationTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockDetailStateCopyWith<StockDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockDetailStateCopyWith<$Res> {
  factory $StockDetailStateCopyWith(
          StockDetailState value, $Res Function(StockDetailState) then) =
      _$StockDetailStateCopyWithImpl<$Res>;
  $Res call(
      {bool isNotificationEnabled,
      DateTime? notificationDate,
      int? notificationDurationDays,
      TimeOfDay? notificationTime});
}

/// @nodoc
class _$StockDetailStateCopyWithImpl<$Res>
    implements $StockDetailStateCopyWith<$Res> {
  _$StockDetailStateCopyWithImpl(this._value, this._then);

  final StockDetailState _value;
  // ignore: unused_field
  final $Res Function(StockDetailState) _then;

  @override
  $Res call({
    Object? isNotificationEnabled = freezed,
    Object? notificationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? notificationTime = freezed,
  }) {
    return _then(_value.copyWith(
      isNotificationEnabled: isNotificationEnabled == freezed
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationDate: notificationDate == freezed
          ? _value.notificationDate
          : notificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notificationDurationDays: notificationDurationDays == freezed
          ? _value.notificationDurationDays
          : notificationDurationDays // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationTime: notificationTime == freezed
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc
abstract class _$ItemDetailStateCopyWith<$Res>
    implements $StockDetailStateCopyWith<$Res> {
  factory _$ItemDetailStateCopyWith(
          _ItemDetailState value, $Res Function(_ItemDetailState) then) =
      __$ItemDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isNotificationEnabled,
      DateTime? notificationDate,
      int? notificationDurationDays,
      TimeOfDay? notificationTime});
}

/// @nodoc
class __$ItemDetailStateCopyWithImpl<$Res>
    extends _$StockDetailStateCopyWithImpl<$Res>
    implements _$ItemDetailStateCopyWith<$Res> {
  __$ItemDetailStateCopyWithImpl(
      _ItemDetailState _value, $Res Function(_ItemDetailState) _then)
      : super(_value, (v) => _then(v as _ItemDetailState));

  @override
  _ItemDetailState get _value => super._value as _ItemDetailState;

  @override
  $Res call({
    Object? isNotificationEnabled = freezed,
    Object? notificationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? notificationTime = freezed,
  }) {
    return _then(_ItemDetailState(
      isNotificationEnabled: isNotificationEnabled == freezed
          ? _value.isNotificationEnabled
          : isNotificationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationDate: notificationDate == freezed
          ? _value.notificationDate
          : notificationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      notificationDurationDays: notificationDurationDays == freezed
          ? _value.notificationDurationDays
          : notificationDurationDays // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationTime: notificationTime == freezed
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
    ));
  }
}

/// @nodoc

class _$_ItemDetailState
    with DiagnosticableTreeMixin
    implements _ItemDetailState {
  const _$_ItemDetailState(
      {this.isNotificationEnabled = false,
      this.notificationDate,
      this.notificationDurationDays,
      this.notificationTime});

  @JsonKey(defaultValue: false)
  @override // 通知のON/OFF
  final bool isNotificationEnabled;
  @override // 通知する日時
  final DateTime? notificationDate;
  @override // 何日前に通知するか
  final int? notificationDurationDays;
  @override // 通知する時刻
  final TimeOfDay? notificationTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockDetailState(isNotificationEnabled: $isNotificationEnabled, notificationDate: $notificationDate, notificationDurationDays: $notificationDurationDays, notificationTime: $notificationTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockDetailState'))
      ..add(DiagnosticsProperty('isNotificationEnabled', isNotificationEnabled))
      ..add(DiagnosticsProperty('notificationDate', notificationDate))
      ..add(DiagnosticsProperty(
          'notificationDurationDays', notificationDurationDays))
      ..add(DiagnosticsProperty('notificationTime', notificationTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ItemDetailState &&
            (identical(other.isNotificationEnabled, isNotificationEnabled) ||
                const DeepCollectionEquality().equals(
                    other.isNotificationEnabled, isNotificationEnabled)) &&
            (identical(other.notificationDate, notificationDate) ||
                const DeepCollectionEquality()
                    .equals(other.notificationDate, notificationDate)) &&
            (identical(
                    other.notificationDurationDays, notificationDurationDays) ||
                const DeepCollectionEquality().equals(
                    other.notificationDurationDays,
                    notificationDurationDays)) &&
            (identical(other.notificationTime, notificationTime) ||
                const DeepCollectionEquality()
                    .equals(other.notificationTime, notificationTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isNotificationEnabled) ^
      const DeepCollectionEquality().hash(notificationDate) ^
      const DeepCollectionEquality().hash(notificationDurationDays) ^
      const DeepCollectionEquality().hash(notificationTime);

  @JsonKey(ignore: true)
  @override
  _$ItemDetailStateCopyWith<_ItemDetailState> get copyWith =>
      __$ItemDetailStateCopyWithImpl<_ItemDetailState>(this, _$identity);
}

abstract class _ItemDetailState implements StockDetailState {
  const factory _ItemDetailState(
      {bool isNotificationEnabled,
      DateTime? notificationDate,
      int? notificationDurationDays,
      TimeOfDay? notificationTime}) = _$_ItemDetailState;

  @override // 通知のON/OFF
  bool get isNotificationEnabled => throw _privateConstructorUsedError;
  @override // 通知する日時
  DateTime? get notificationDate => throw _privateConstructorUsedError;
  @override // 何日前に通知するか
  int? get notificationDurationDays => throw _privateConstructorUsedError;
  @override // 通知する時刻
  TimeOfDay? get notificationTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemDetailStateCopyWith<_ItemDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
