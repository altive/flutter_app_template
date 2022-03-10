// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notification_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return _NotificationPayload.fromJson(json);
}

/// @nodoc
class _$NotificationPayloadTearOff {
  const _$NotificationPayloadTearOff();

  _NotificationPayload call(
      {required String documentId,
      required String itemName,
      required DateTime expirationDate,
      required int notificationDurationDays,
      required int hour,
      required int minute}) {
    return _NotificationPayload(
      documentId: documentId,
      itemName: itemName,
      expirationDate: expirationDate,
      notificationDurationDays: notificationDurationDays,
      hour: hour,
      minute: minute,
    );
  }

  NotificationPayload fromJson(Map<String, Object> json) {
    return NotificationPayload.fromJson(json);
  }
}

/// @nodoc
const $NotificationPayload = _$NotificationPayloadTearOff();

/// @nodoc
mixin _$NotificationPayload {
  String get documentId => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  int get notificationDurationDays => throw _privateConstructorUsedError;
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPayloadCopyWith<NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPayloadCopyWith<$Res> {
  factory $NotificationPayloadCopyWith(
          NotificationPayload value, $Res Function(NotificationPayload) then) =
      _$NotificationPayloadCopyWithImpl<$Res>;
  $Res call(
      {String documentId,
      String itemName,
      DateTime expirationDate,
      int notificationDurationDays,
      int hour,
      int minute});
}

/// @nodoc
class _$NotificationPayloadCopyWithImpl<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  _$NotificationPayloadCopyWithImpl(this._value, this._then);

  final NotificationPayload _value;
  // ignore: unused_field
  final $Res Function(NotificationPayload) _then;

  @override
  $Res call({
    Object? documentId = freezed,
    Object? itemName = freezed,
    Object? expirationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_value.copyWith(
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationDurationDays: notificationDurationDays == freezed
          ? _value.notificationDurationDays
          : notificationDurationDays // ignore: cast_nullable_to_non_nullable
              as int,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NotificationPayloadCopyWith<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  factory _$NotificationPayloadCopyWith(_NotificationPayload value,
          $Res Function(_NotificationPayload) then) =
      __$NotificationPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {String documentId,
      String itemName,
      DateTime expirationDate,
      int notificationDurationDays,
      int hour,
      int minute});
}

/// @nodoc
class __$NotificationPayloadCopyWithImpl<$Res>
    extends _$NotificationPayloadCopyWithImpl<$Res>
    implements _$NotificationPayloadCopyWith<$Res> {
  __$NotificationPayloadCopyWithImpl(
      _NotificationPayload _value, $Res Function(_NotificationPayload) _then)
      : super(_value, (v) => _then(v as _NotificationPayload));

  @override
  _NotificationPayload get _value => super._value as _NotificationPayload;

  @override
  $Res call({
    Object? documentId = freezed,
    Object? itemName = freezed,
    Object? expirationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_NotificationPayload(
      documentId: documentId == freezed
          ? _value.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: itemName == freezed
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: expirationDate == freezed
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      notificationDurationDays: notificationDurationDays == freezed
          ? _value.notificationDurationDays
          : notificationDurationDays // ignore: cast_nullable_to_non_nullable
              as int,
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPayload extends _NotificationPayload
    with DiagnosticableTreeMixin {
  const _$_NotificationPayload(
      {required this.documentId,
      required this.itemName,
      required this.expirationDate,
      required this.notificationDurationDays,
      required this.hour,
      required this.minute})
      : super._();

  factory _$_NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$_$_NotificationPayloadFromJson(json);

  @override
  final String documentId;
  @override
  final String itemName;
  @override
  final DateTime expirationDate;
  @override
  final int notificationDurationDays;
  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationPayload(documentId: $documentId, itemName: $itemName, expirationDate: $expirationDate, notificationDurationDays: $notificationDurationDays, hour: $hour, minute: $minute)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationPayload'))
      ..add(DiagnosticsProperty('documentId', documentId))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('expirationDate', expirationDate))
      ..add(DiagnosticsProperty(
          'notificationDurationDays', notificationDurationDays))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minute', minute));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationPayload &&
            (identical(other.documentId, documentId) ||
                const DeepCollectionEquality()
                    .equals(other.documentId, documentId)) &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.expirationDate, expirationDate) ||
                const DeepCollectionEquality()
                    .equals(other.expirationDate, expirationDate)) &&
            (identical(
                    other.notificationDurationDays, notificationDurationDays) ||
                const DeepCollectionEquality().equals(
                    other.notificationDurationDays,
                    notificationDurationDays)) &&
            (identical(other.hour, hour) ||
                const DeepCollectionEquality().equals(other.hour, hour)) &&
            (identical(other.minute, minute) ||
                const DeepCollectionEquality().equals(other.minute, minute)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(documentId) ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(expirationDate) ^
      const DeepCollectionEquality().hash(notificationDurationDays) ^
      const DeepCollectionEquality().hash(hour) ^
      const DeepCollectionEquality().hash(minute);

  @JsonKey(ignore: true)
  @override
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      __$NotificationPayloadCopyWithImpl<_NotificationPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NotificationPayloadToJson(this);
  }
}

abstract class _NotificationPayload extends NotificationPayload {
  const factory _NotificationPayload(
      {required String documentId,
      required String itemName,
      required DateTime expirationDate,
      required int notificationDurationDays,
      required int hour,
      required int minute}) = _$_NotificationPayload;
  const _NotificationPayload._() : super._();

  factory _NotificationPayload.fromJson(Map<String, dynamic> json) =
      _$_NotificationPayload.fromJson;

  @override
  String get documentId => throw _privateConstructorUsedError;
  @override
  String get itemName => throw _privateConstructorUsedError;
  @override
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @override
  int get notificationDurationDays => throw _privateConstructorUsedError;
  @override
  int get hour => throw _privateConstructorUsedError;
  @override
  int get minute => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
