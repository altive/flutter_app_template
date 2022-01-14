// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'requested_version_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestedVersionInfo _$RequestedVersionInfoFromJson(Map<String, dynamic> json) {
  return _RequestedVersionInfo.fromJson(json);
}

/// @nodoc
class _$RequestedVersionInfoTearOff {
  const _$RequestedVersionInfoTearOff();

  _RequestedVersionInfo call(
      {required String requiredVersion,
      bool canCancel = false,
      required DateTime enabledAt}) {
    return _RequestedVersionInfo(
      requiredVersion: requiredVersion,
      canCancel: canCancel,
      enabledAt: enabledAt,
    );
  }

  RequestedVersionInfo fromJson(Map<String, Object?> json) {
    return RequestedVersionInfo.fromJson(json);
  }
}

/// @nodoc
const $RequestedVersionInfo = _$RequestedVersionInfoTearOff();

/// @nodoc
mixin _$RequestedVersionInfo {
  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion => throw _privateConstructorUsedError;

  /// アップデートをキャンセルして利用可能にするかどうか
  bool get canCancel => throw _privateConstructorUsedError;

  /// アップデート要求を有強化する日時
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestedVersionInfoCopyWith<RequestedVersionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestedVersionInfoCopyWith<$Res> {
  factory $RequestedVersionInfoCopyWith(RequestedVersionInfo value,
          $Res Function(RequestedVersionInfo) then) =
      _$RequestedVersionInfoCopyWithImpl<$Res>;
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$RequestedVersionInfoCopyWithImpl<$Res>
    implements $RequestedVersionInfoCopyWith<$Res> {
  _$RequestedVersionInfoCopyWithImpl(this._value, this._then);

  final RequestedVersionInfo _value;
  // ignore: unused_field
  final $Res Function(RequestedVersionInfo) _then;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_value.copyWith(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$RequestedVersionInfoCopyWith<$Res>
    implements $RequestedVersionInfoCopyWith<$Res> {
  factory _$RequestedVersionInfoCopyWith(_RequestedVersionInfo value,
          $Res Function(_RequestedVersionInfo) then) =
      __$RequestedVersionInfoCopyWithImpl<$Res>;
  @override
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$RequestedVersionInfoCopyWithImpl<$Res>
    extends _$RequestedVersionInfoCopyWithImpl<$Res>
    implements _$RequestedVersionInfoCopyWith<$Res> {
  __$RequestedVersionInfoCopyWithImpl(
      _RequestedVersionInfo _value, $Res Function(_RequestedVersionInfo) _then)
      : super(_value, (v) => _then(v as _RequestedVersionInfo));

  @override
  _RequestedVersionInfo get _value => super._value as _RequestedVersionInfo;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_RequestedVersionInfo(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestedVersionInfo
    with DiagnosticableTreeMixin
    implements _RequestedVersionInfo {
  const _$_RequestedVersionInfo(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$_RequestedVersionInfo.fromJson(Map<String, dynamic> json) =>
      _$$_RequestedVersionInfoFromJson(json);

  @override

  /// 要求バージョン e.g., '1.0.0'
  final String requiredVersion;
  @JsonKey()
  @override

  /// アップデートをキャンセルして利用可能にするかどうか
  final bool canCancel;
  @override

  /// アップデート要求を有強化する日時
  final DateTime enabledAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RequestedVersionInfo(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RequestedVersionInfo'))
      ..add(DiagnosticsProperty('requiredVersion', requiredVersion))
      ..add(DiagnosticsProperty('canCancel', canCancel))
      ..add(DiagnosticsProperty('enabledAt', enabledAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequestedVersionInfo &&
            const DeepCollectionEquality()
                .equals(other.requiredVersion, requiredVersion) &&
            const DeepCollectionEquality().equals(other.canCancel, canCancel) &&
            const DeepCollectionEquality().equals(other.enabledAt, enabledAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requiredVersion),
      const DeepCollectionEquality().hash(canCancel),
      const DeepCollectionEquality().hash(enabledAt));

  @JsonKey(ignore: true)
  @override
  _$RequestedVersionInfoCopyWith<_RequestedVersionInfo> get copyWith =>
      __$RequestedVersionInfoCopyWithImpl<_RequestedVersionInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestedVersionInfoToJson(this);
  }
}

abstract class _RequestedVersionInfo implements RequestedVersionInfo {
  const factory _RequestedVersionInfo(
      {required String requiredVersion,
      bool canCancel,
      required DateTime enabledAt}) = _$_RequestedVersionInfo;

  factory _RequestedVersionInfo.fromJson(Map<String, dynamic> json) =
      _$_RequestedVersionInfo.fromJson;

  @override

  /// 要求バージョン e.g., '1.0.0'
  String get requiredVersion;
  @override

  /// アップデートをキャンセルして利用可能にするかどうか
  bool get canCancel;
  @override

  /// アップデート要求を有強化する日時
  DateTime get enabledAt;
  @override
  @JsonKey(ignore: true)
  _$RequestedVersionInfoCopyWith<_RequestedVersionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
