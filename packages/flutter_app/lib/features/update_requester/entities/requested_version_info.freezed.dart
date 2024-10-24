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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this RequestedVersionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestedVersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of RequestedVersionInfo
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$RequestedVersionInfoImplCopyWith<$Res>
    implements $RequestedVersionInfoCopyWith<$Res> {
  factory _$$RequestedVersionInfoImplCopyWith(_$RequestedVersionInfoImpl value,
          $Res Function(_$RequestedVersionInfoImpl) then) =
      __$$RequestedVersionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$$RequestedVersionInfoImplCopyWithImpl<$Res>
    extends _$RequestedVersionInfoCopyWithImpl<$Res, _$RequestedVersionInfoImpl>
    implements _$$RequestedVersionInfoImplCopyWith<$Res> {
  __$$RequestedVersionInfoImplCopyWithImpl(_$RequestedVersionInfoImpl _value,
      $Res Function(_$RequestedVersionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestedVersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredVersion = null,
    Object? canCancel = null,
    Object? enabledAt = null,
  }) {
    return _then(_$RequestedVersionInfoImpl(
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
class _$RequestedVersionInfoImpl
    with DiagnosticableTreeMixin
    implements _RequestedVersionInfo {
  const _$RequestedVersionInfoImpl(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$RequestedVersionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestedVersionInfoImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestedVersionInfoImpl &&
            (identical(other.requiredVersion, requiredVersion) ||
                other.requiredVersion == requiredVersion) &&
            (identical(other.canCancel, canCancel) ||
                other.canCancel == canCancel) &&
            (identical(other.enabledAt, enabledAt) ||
                other.enabledAt == enabledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, requiredVersion, canCancel, enabledAt);

  /// Create a copy of RequestedVersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestedVersionInfoImplCopyWith<_$RequestedVersionInfoImpl>
      get copyWith =>
          __$$RequestedVersionInfoImplCopyWithImpl<_$RequestedVersionInfoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestedVersionInfoImplToJson(
      this,
    );
  }
}

abstract class _RequestedVersionInfo implements RequestedVersionInfo {
  const factory _RequestedVersionInfo(
      {required final String requiredVersion,
      final bool canCancel,
      required final DateTime enabledAt}) = _$RequestedVersionInfoImpl;

  factory _RequestedVersionInfo.fromJson(Map<String, dynamic> json) =
      _$RequestedVersionInfoImpl.fromJson;

  /// 要求バージョン e.g., '1.0.0'
  @override
  String get requiredVersion;

  /// アップデートをキャンセルして利用可能にするかどうか
  @override
  bool get canCancel;

  /// アップデート要求を有強化する日時
  @override
  DateTime get enabledAt;

  /// Create a copy of RequestedVersionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestedVersionInfoImplCopyWith<_$RequestedVersionInfoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
