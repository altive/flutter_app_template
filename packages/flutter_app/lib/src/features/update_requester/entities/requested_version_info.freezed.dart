// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requested_version_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestedVersionInfo _$RequestedVersionInfoFromJson(Map<String, dynamic> json) {
  return _RequestedVersionInfo.fromJson(json);
}

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
      _$RequestedVersionInfoCopyWithImpl<$Res, RequestedVersionInfo>;
  @useResult
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$RequestedVersionInfoCopyWithImpl<$Res,
        $Val extends RequestedVersionInfo>
    implements $RequestedVersionInfoCopyWith<$Res> {
  _$RequestedVersionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredVersion = null,
    Object? canCancel = null,
    Object? enabledAt = null,
  }) {
    return _then(_value.copyWith(
      requiredVersion: null == requiredVersion
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: null == enabledAt
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestedVersionInfoCopyWith<$Res>
    implements $RequestedVersionInfoCopyWith<$Res> {
  factory _$$_RequestedVersionInfoCopyWith(_$_RequestedVersionInfo value,
          $Res Function(_$_RequestedVersionInfo) then) =
      __$$_RequestedVersionInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$$_RequestedVersionInfoCopyWithImpl<$Res>
    extends _$RequestedVersionInfoCopyWithImpl<$Res, _$_RequestedVersionInfo>
    implements _$$_RequestedVersionInfoCopyWith<$Res> {
  __$$_RequestedVersionInfoCopyWithImpl(_$_RequestedVersionInfo _value,
      $Res Function(_$_RequestedVersionInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredVersion = null,
    Object? canCancel = null,
    Object? enabledAt = null,
  }) {
    return _then(_$_RequestedVersionInfo(
      requiredVersion: null == requiredVersion
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: null == canCancel
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: null == enabledAt
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

  /// 要求バージョン e.g., '1.0.0'
  @override
  final String requiredVersion;

  /// アップデートをキャンセルして利用可能にするかどうか
  @override
  @JsonKey()
  final bool canCancel;

  /// アップデート要求を有強化する日時
  @override
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
            other is _$_RequestedVersionInfo &&
            (identical(other.requiredVersion, requiredVersion) ||
                other.requiredVersion == requiredVersion) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            (identical(other.enabledAt, enabledAt) ||
                other.enabledAt == enabledAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, requiredVersion, canCancel, enabledAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestedVersionInfoCopyWith<_$_RequestedVersionInfo> get copyWith =>
      __$$_RequestedVersionInfoCopyWithImpl<_$_RequestedVersionInfo>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestedVersionInfoToJson(
      this,
    );
  }
}

abstract class _RequestedVersionInfo implements RequestedVersionInfo {
  const factory _RequestedVersionInfo(
      {required final String requiredVersion,
      final bool canCancel,
      required final DateTime enabledAt}) = _$_RequestedVersionInfo;

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
  _$$_RequestedVersionInfoCopyWith<_$_RequestedVersionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
