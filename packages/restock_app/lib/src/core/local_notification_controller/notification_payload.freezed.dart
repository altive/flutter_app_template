// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return _NotificationPayload.fromJson(json);
}

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
abstract class _$$_NotificationPayloadCopyWith<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  factory _$$_NotificationPayloadCopyWith(_$_NotificationPayload value,
          $Res Function(_$_NotificationPayload) then) =
      __$$_NotificationPayloadCopyWithImpl<$Res>;
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
class __$$_NotificationPayloadCopyWithImpl<$Res>
    extends _$NotificationPayloadCopyWithImpl<$Res>
    implements _$$_NotificationPayloadCopyWith<$Res> {
  __$$_NotificationPayloadCopyWithImpl(_$_NotificationPayload _value,
      $Res Function(_$_NotificationPayload) _then)
      : super(_value, (v) => _then(v as _$_NotificationPayload));

  @override
  _$_NotificationPayload get _value => super._value as _$_NotificationPayload;

  @override
  $Res call({
    Object? documentId = freezed,
    Object? itemName = freezed,
    Object? expirationDate = freezed,
    Object? notificationDurationDays = freezed,
    Object? hour = freezed,
    Object? minute = freezed,
  }) {
    return _then(_$_NotificationPayload(
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
      _$$_NotificationPayloadFromJson(json);

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
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPayload &&
            const DeepCollectionEquality()
                .equals(other.documentId, documentId) &&
            const DeepCollectionEquality().equals(other.itemName, itemName) &&
            const DeepCollectionEquality()
                .equals(other.expirationDate, expirationDate) &&
            const DeepCollectionEquality().equals(
                other.notificationDurationDays, notificationDurationDays) &&
            const DeepCollectionEquality().equals(other.hour, hour) &&
            const DeepCollectionEquality().equals(other.minute, minute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(documentId),
      const DeepCollectionEquality().hash(itemName),
      const DeepCollectionEquality().hash(expirationDate),
      const DeepCollectionEquality().hash(notificationDurationDays),
      const DeepCollectionEquality().hash(hour),
      const DeepCollectionEquality().hash(minute));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationPayloadCopyWith<_$_NotificationPayload> get copyWith =>
      __$$_NotificationPayloadCopyWithImpl<_$_NotificationPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPayloadToJson(this);
  }
}

abstract class _NotificationPayload extends NotificationPayload {
  const factory _NotificationPayload(
      {required final String documentId,
      required final String itemName,
      required final DateTime expirationDate,
      required final int notificationDurationDays,
      required final int hour,
      required final int minute}) = _$_NotificationPayload;
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
  _$$_NotificationPayloadCopyWith<_$_NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
