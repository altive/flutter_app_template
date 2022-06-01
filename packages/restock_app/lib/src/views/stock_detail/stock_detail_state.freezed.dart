// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_ItemDetailStateCopyWith<$Res>
    implements $StockDetailStateCopyWith<$Res> {
  factory _$$_ItemDetailStateCopyWith(
          _$_ItemDetailState value, $Res Function(_$_ItemDetailState) then) =
      __$$_ItemDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isNotificationEnabled,
      DateTime? notificationDate,
      int? notificationDurationDays,
      TimeOfDay? notificationTime});
}

/// @nodoc
class __$$_ItemDetailStateCopyWithImpl<$Res>
    extends _$StockDetailStateCopyWithImpl<$Res>
    implements _$$_ItemDetailStateCopyWith<$Res> {
  __$$_ItemDetailStateCopyWithImpl(
      _$_ItemDetailState _value, $Res Function(_$_ItemDetailState) _then)
      : super(_value, (v) => _then(v as _$_ItemDetailState));

  @override
  _$_ItemDetailState get _value => super._value as _$_ItemDetailState;

  @override
  $Res call({
    Object? isNotificationEnabled = freezed,
    Object? notificationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? notificationTime = freezed,
  }) {
    return _then(_$_ItemDetailState(
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

// 通知のON/OFF
  @override
  @JsonKey()
  final bool isNotificationEnabled;
// 通知する日時
  @override
  final DateTime? notificationDate;
// 何日前に通知するか
  @override
  final int? notificationDurationDays;
// 通知する時刻
  @override
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
        (other.runtimeType == runtimeType &&
            other is _$_ItemDetailState &&
            const DeepCollectionEquality()
                .equals(other.isNotificationEnabled, isNotificationEnabled) &&
            const DeepCollectionEquality()
                .equals(other.notificationDate, notificationDate) &&
            const DeepCollectionEquality().equals(
                other.notificationDurationDays, notificationDurationDays) &&
            const DeepCollectionEquality()
                .equals(other.notificationTime, notificationTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isNotificationEnabled),
      const DeepCollectionEquality().hash(notificationDate),
      const DeepCollectionEquality().hash(notificationDurationDays),
      const DeepCollectionEquality().hash(notificationTime));

  @JsonKey(ignore: true)
  @override
  _$$_ItemDetailStateCopyWith<_$_ItemDetailState> get copyWith =>
      __$$_ItemDetailStateCopyWithImpl<_$_ItemDetailState>(this, _$identity);
}

abstract class _ItemDetailState implements StockDetailState {
  const factory _ItemDetailState(
      {final bool isNotificationEnabled,
      final DateTime? notificationDate,
      final int? notificationDurationDays,
      final TimeOfDay? notificationTime}) = _$_ItemDetailState;

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
  _$$_ItemDetailStateCopyWith<_$_ItemDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
