// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return _UserRequest.fromJson(json);
}

/// @nodoc
class _$UserRequestTearOff {
  const _$UserRequestTearOff();

  _UserRequest call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      required String uid,
      String? deviceName,
      String? deviceOS,
      required String appName,
      String? packageName,
      required String version,
      required String buildNumber,
      required String replyFor,
      required String text}) {
    return _UserRequest(
      createdAt: createdAt,
      updatedAt: updatedAt,
      uid: uid,
      deviceName: deviceName,
      deviceOS: deviceOS,
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
      replyFor: replyFor,
      text: text,
    );
  }

  UserRequest fromJson(Map<String, Object> json) {
    return UserRequest.fromJson(json);
  }
}

/// @nodoc
const $UserRequest = _$UserRequestTearOff();

/// @nodoc
mixin _$UserRequest {
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String? get deviceName => throw _privateConstructorUsedError;
  String? get deviceOS => throw _privateConstructorUsedError;
  String get appName => throw _privateConstructorUsedError;
  String? get packageName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;
  String get replyFor => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRequestCopyWith<UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestCopyWith<$Res> {
  factory $UserRequestCopyWith(
          UserRequest value, $Res Function(UserRequest) then) =
      _$UserRequestCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String uid,
      String? deviceName,
      String? deviceOS,
      String appName,
      String? packageName,
      String version,
      String buildNumber,
      String replyFor,
      String text});
}

/// @nodoc
class _$UserRequestCopyWithImpl<$Res> implements $UserRequestCopyWith<$Res> {
  _$UserRequestCopyWithImpl(this._value, this._then);

  final UserRequest _value;
  // ignore: unused_field
  final $Res Function(UserRequest) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uid = freezed,
    Object? deviceName = freezed,
    Object? deviceOS = freezed,
    Object? appName = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? replyFor = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: deviceOS == freezed
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      replyFor: replyFor == freezed
          ? _value.replyFor
          : replyFor // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserRequestCopyWith<$Res>
    implements $UserRequestCopyWith<$Res> {
  factory _$UserRequestCopyWith(
          _UserRequest value, $Res Function(_UserRequest) then) =
      __$UserRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String uid,
      String? deviceName,
      String? deviceOS,
      String appName,
      String? packageName,
      String version,
      String buildNumber,
      String replyFor,
      String text});
}

/// @nodoc
class __$UserRequestCopyWithImpl<$Res> extends _$UserRequestCopyWithImpl<$Res>
    implements _$UserRequestCopyWith<$Res> {
  __$UserRequestCopyWithImpl(
      _UserRequest _value, $Res Function(_UserRequest) _then)
      : super(_value, (v) => _then(v as _UserRequest));

  @override
  _UserRequest get _value => super._value as _UserRequest;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? uid = freezed,
    Object? deviceName = freezed,
    Object? deviceOS = freezed,
    Object? appName = freezed,
    Object? packageName = freezed,
    Object? version = freezed,
    Object? buildNumber = freezed,
    Object? replyFor = freezed,
    Object? text = freezed,
  }) {
    return _then(_UserRequest(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: deviceName == freezed
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: deviceOS == freezed
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: packageName == freezed
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: buildNumber == freezed
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
      replyFor: replyFor == freezed
          ? _value.replyFor
          : replyFor // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRequest extends _UserRequest with DiagnosticableTreeMixin {
  const _$_UserRequest(
      {@TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      required this.uid,
      this.deviceName,
      this.deviceOS,
      required this.appName,
      this.packageName,
      required this.version,
      required this.buildNumber,
      required this.replyFor,
      required this.text})
      : super._();

  factory _$_UserRequest.fromJson(Map<String, dynamic> json) =>
      _$$_UserRequestFromJson(json);

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  final String uid;
  @override
  final String? deviceName;
  @override
  final String? deviceOS;
  @override
  final String appName;
  @override
  final String? packageName;
  @override
  final String version;
  @override
  final String buildNumber;
  @override
  final String replyFor;
  @override
  final String text;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserRequest(createdAt: $createdAt, updatedAt: $updatedAt, uid: $uid, deviceName: $deviceName, deviceOS: $deviceOS, appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber, replyFor: $replyFor, text: $text)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserRequest'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('deviceName', deviceName))
      ..add(DiagnosticsProperty('deviceOS', deviceOS))
      ..add(DiagnosticsProperty('appName', appName))
      ..add(DiagnosticsProperty('packageName', packageName))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('buildNumber', buildNumber))
      ..add(DiagnosticsProperty('replyFor', replyFor))
      ..add(DiagnosticsProperty('text', text));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserRequest &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.deviceName, deviceName) ||
                const DeepCollectionEquality()
                    .equals(other.deviceName, deviceName)) &&
            (identical(other.deviceOS, deviceOS) ||
                const DeepCollectionEquality()
                    .equals(other.deviceOS, deviceOS)) &&
            (identical(other.appName, appName) ||
                const DeepCollectionEquality()
                    .equals(other.appName, appName)) &&
            (identical(other.packageName, packageName) ||
                const DeepCollectionEquality()
                    .equals(other.packageName, packageName)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.buildNumber, buildNumber) ||
                const DeepCollectionEquality()
                    .equals(other.buildNumber, buildNumber)) &&
            (identical(other.replyFor, replyFor) ||
                const DeepCollectionEquality()
                    .equals(other.replyFor, replyFor)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(deviceName) ^
      const DeepCollectionEquality().hash(deviceOS) ^
      const DeepCollectionEquality().hash(appName) ^
      const DeepCollectionEquality().hash(packageName) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(buildNumber) ^
      const DeepCollectionEquality().hash(replyFor) ^
      const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  _$UserRequestCopyWith<_UserRequest> get copyWith =>
      __$UserRequestCopyWithImpl<_UserRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRequestToJson(this);
  }
}

abstract class _UserRequest extends UserRequest {
  const factory _UserRequest(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      required String uid,
      String? deviceName,
      String? deviceOS,
      required String appName,
      String? packageName,
      required String version,
      required String buildNumber,
      required String replyFor,
      required String text}) = _$_UserRequest;
  const _UserRequest._() : super._();

  factory _UserRequest.fromJson(Map<String, dynamic> json) =
      _$_UserRequest.fromJson;

  @override
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  String get uid => throw _privateConstructorUsedError;
  @override
  String? get deviceName => throw _privateConstructorUsedError;
  @override
  String? get deviceOS => throw _privateConstructorUsedError;
  @override
  String get appName => throw _privateConstructorUsedError;
  @override
  String? get packageName => throw _privateConstructorUsedError;
  @override
  String get version => throw _privateConstructorUsedError;
  @override
  String get buildNumber => throw _privateConstructorUsedError;
  @override
  String get replyFor => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserRequestCopyWith<_UserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
