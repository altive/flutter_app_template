// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_package_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LatestPackageRelease {

 PackagePubspec get pubspec;
/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LatestPackageReleaseCopyWith<LatestPackageRelease> get copyWith => _$LatestPackageReleaseCopyWithImpl<LatestPackageRelease>(this as LatestPackageRelease, _$identity);

  /// Serializes this LatestPackageRelease to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LatestPackageRelease&&(identical(other.pubspec, pubspec) || other.pubspec == pubspec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pubspec);

@override
String toString() {
  return 'LatestPackageRelease(pubspec: $pubspec)';
}


}

/// @nodoc
abstract mixin class $LatestPackageReleaseCopyWith<$Res>  {
  factory $LatestPackageReleaseCopyWith(LatestPackageRelease value, $Res Function(LatestPackageRelease) _then) = _$LatestPackageReleaseCopyWithImpl;
@useResult
$Res call({
 PackagePubspec pubspec
});


$PackagePubspecCopyWith<$Res> get pubspec;

}
/// @nodoc
class _$LatestPackageReleaseCopyWithImpl<$Res>
    implements $LatestPackageReleaseCopyWith<$Res> {
  _$LatestPackageReleaseCopyWithImpl(this._self, this._then);

  final LatestPackageRelease _self;
  final $Res Function(LatestPackageRelease) _then;

/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pubspec = null,}) {
  return _then(_self.copyWith(
pubspec: null == pubspec ? _self.pubspec : pubspec // ignore: cast_nullable_to_non_nullable
as PackagePubspec,
  ));
}
/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePubspecCopyWith<$Res> get pubspec {
  
  return $PackagePubspecCopyWith<$Res>(_self.pubspec, (value) {
    return _then(_self.copyWith(pubspec: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _LatestPackageRelease implements LatestPackageRelease {
  const _LatestPackageRelease({required this.pubspec});
  factory _LatestPackageRelease.fromJson(Map<String, dynamic> json) => _$LatestPackageReleaseFromJson(json);

@override final  PackagePubspec pubspec;

/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LatestPackageReleaseCopyWith<_LatestPackageRelease> get copyWith => __$LatestPackageReleaseCopyWithImpl<_LatestPackageRelease>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LatestPackageReleaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LatestPackageRelease&&(identical(other.pubspec, pubspec) || other.pubspec == pubspec));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pubspec);

@override
String toString() {
  return 'LatestPackageRelease(pubspec: $pubspec)';
}


}

/// @nodoc
abstract mixin class _$LatestPackageReleaseCopyWith<$Res> implements $LatestPackageReleaseCopyWith<$Res> {
  factory _$LatestPackageReleaseCopyWith(_LatestPackageRelease value, $Res Function(_LatestPackageRelease) _then) = __$LatestPackageReleaseCopyWithImpl;
@override @useResult
$Res call({
 PackagePubspec pubspec
});


@override $PackagePubspecCopyWith<$Res> get pubspec;

}
/// @nodoc
class __$LatestPackageReleaseCopyWithImpl<$Res>
    implements _$LatestPackageReleaseCopyWith<$Res> {
  __$LatestPackageReleaseCopyWithImpl(this._self, this._then);

  final _LatestPackageRelease _self;
  final $Res Function(_LatestPackageRelease) _then;

/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pubspec = null,}) {
  return _then(_LatestPackageRelease(
pubspec: null == pubspec ? _self.pubspec : pubspec // ignore: cast_nullable_to_non_nullable
as PackagePubspec,
  ));
}

/// Create a copy of LatestPackageRelease
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackagePubspecCopyWith<$Res> get pubspec {
  
  return $PackagePubspecCopyWith<$Res>(_self.pubspec, (value) {
    return _then(_self.copyWith(pubspec: value));
  });
}
}

// dart format on
