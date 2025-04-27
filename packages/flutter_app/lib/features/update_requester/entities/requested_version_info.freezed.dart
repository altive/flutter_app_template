// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requested_version_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestedVersionInfo implements DiagnosticableTreeMixin {

/// 要求バージョン e.g., '1.0.0'
 String get requiredVersion;/// アップデートをキャンセルして利用可能にするかどうか
 bool get canCancel;/// アップデート要求を有強化する日時
 DateTime get enabledAt;
/// Create a copy of RequestedVersionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestedVersionInfoCopyWith<RequestedVersionInfo> get copyWith => _$RequestedVersionInfoCopyWithImpl<RequestedVersionInfo>(this as RequestedVersionInfo, _$identity);

  /// Serializes this RequestedVersionInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestedVersionInfo'))
    ..add(DiagnosticsProperty('requiredVersion', requiredVersion))..add(DiagnosticsProperty('canCancel', canCancel))..add(DiagnosticsProperty('enabledAt', enabledAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestedVersionInfo&&(identical(other.requiredVersion, requiredVersion) || other.requiredVersion == requiredVersion)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requiredVersion,canCancel,enabledAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestedVersionInfo(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class $RequestedVersionInfoCopyWith<$Res>  {
  factory $RequestedVersionInfoCopyWith(RequestedVersionInfo value, $Res Function(RequestedVersionInfo) _then) = _$RequestedVersionInfoCopyWithImpl;
@useResult
$Res call({
 String requiredVersion, bool canCancel, DateTime enabledAt
});




}
/// @nodoc
class _$RequestedVersionInfoCopyWithImpl<$Res>
    implements $RequestedVersionInfoCopyWith<$Res> {
  _$RequestedVersionInfoCopyWithImpl(this._self, this._then);

  final RequestedVersionInfo _self;
  final $Res Function(RequestedVersionInfo) _then;

/// Create a copy of RequestedVersionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requiredVersion = null,Object? canCancel = null,Object? enabledAt = null,}) {
  return _then(_self.copyWith(
requiredVersion: null == requiredVersion ? _self.requiredVersion : requiredVersion // ignore: cast_nullable_to_non_nullable
as String,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: null == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RequestedVersionInfo with DiagnosticableTreeMixin implements RequestedVersionInfo {
  const _RequestedVersionInfo({required this.requiredVersion, this.canCancel = false, required this.enabledAt});
  factory _RequestedVersionInfo.fromJson(Map<String, dynamic> json) => _$RequestedVersionInfoFromJson(json);

/// 要求バージョン e.g., '1.0.0'
@override final  String requiredVersion;
/// アップデートをキャンセルして利用可能にするかどうか
@override@JsonKey() final  bool canCancel;
/// アップデート要求を有強化する日時
@override final  DateTime enabledAt;

/// Create a copy of RequestedVersionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestedVersionInfoCopyWith<_RequestedVersionInfo> get copyWith => __$RequestedVersionInfoCopyWithImpl<_RequestedVersionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestedVersionInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestedVersionInfo'))
    ..add(DiagnosticsProperty('requiredVersion', requiredVersion))..add(DiagnosticsProperty('canCancel', canCancel))..add(DiagnosticsProperty('enabledAt', enabledAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestedVersionInfo&&(identical(other.requiredVersion, requiredVersion) || other.requiredVersion == requiredVersion)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.enabledAt, enabledAt) || other.enabledAt == enabledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requiredVersion,canCancel,enabledAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestedVersionInfo(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
}


}

/// @nodoc
abstract mixin class _$RequestedVersionInfoCopyWith<$Res> implements $RequestedVersionInfoCopyWith<$Res> {
  factory _$RequestedVersionInfoCopyWith(_RequestedVersionInfo value, $Res Function(_RequestedVersionInfo) _then) = __$RequestedVersionInfoCopyWithImpl;
@override @useResult
$Res call({
 String requiredVersion, bool canCancel, DateTime enabledAt
});




}
/// @nodoc
class __$RequestedVersionInfoCopyWithImpl<$Res>
    implements _$RequestedVersionInfoCopyWith<$Res> {
  __$RequestedVersionInfoCopyWithImpl(this._self, this._then);

  final _RequestedVersionInfo _self;
  final $Res Function(_RequestedVersionInfo) _then;

/// Create a copy of RequestedVersionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requiredVersion = null,Object? canCancel = null,Object? enabledAt = null,}) {
  return _then(_RequestedVersionInfo(
requiredVersion: null == requiredVersion ? _self.requiredVersion : requiredVersion // ignore: cast_nullable_to_non_nullable
as String,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,enabledAt: null == enabledAt ? _self.enabledAt : enabledAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
