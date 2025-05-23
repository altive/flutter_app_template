// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_searched_packages_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetSearchedPackagesResponseBody {

 List<PackageName> get packages;// e.g. "https://pub.dev/api/search?page=2"
@JsonKey(name: 'next') String? get nextPageUrl;
/// Create a copy of GetSearchedPackagesResponseBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetSearchedPackagesResponseBodyCopyWith<GetSearchedPackagesResponseBody> get copyWith => _$GetSearchedPackagesResponseBodyCopyWithImpl<GetSearchedPackagesResponseBody>(this as GetSearchedPackagesResponseBody, _$identity);

  /// Serializes this GetSearchedPackagesResponseBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetSearchedPackagesResponseBody&&const DeepCollectionEquality().equals(other.packages, packages)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(packages),nextPageUrl);

@override
String toString() {
  return 'GetSearchedPackagesResponseBody(packages: $packages, nextPageUrl: $nextPageUrl)';
}


}

/// @nodoc
abstract mixin class $GetSearchedPackagesResponseBodyCopyWith<$Res>  {
  factory $GetSearchedPackagesResponseBodyCopyWith(GetSearchedPackagesResponseBody value, $Res Function(GetSearchedPackagesResponseBody) _then) = _$GetSearchedPackagesResponseBodyCopyWithImpl;
@useResult
$Res call({
 List<PackageName> packages,@JsonKey(name: 'next') String? nextPageUrl
});




}
/// @nodoc
class _$GetSearchedPackagesResponseBodyCopyWithImpl<$Res>
    implements $GetSearchedPackagesResponseBodyCopyWith<$Res> {
  _$GetSearchedPackagesResponseBodyCopyWithImpl(this._self, this._then);

  final GetSearchedPackagesResponseBody _self;
  final $Res Function(GetSearchedPackagesResponseBody) _then;

/// Create a copy of GetSearchedPackagesResponseBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? packages = null,Object? nextPageUrl = freezed,}) {
  return _then(_self.copyWith(
packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageName>,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GetSearchedPackagesResponseBody extends GetSearchedPackagesResponseBody {
  const _GetSearchedPackagesResponseBody({required final  List<PackageName> packages, @JsonKey(name: 'next') this.nextPageUrl}): _packages = packages,super._();
  factory _GetSearchedPackagesResponseBody.fromJson(Map<String, dynamic> json) => _$GetSearchedPackagesResponseBodyFromJson(json);

 final  List<PackageName> _packages;
@override List<PackageName> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

// e.g. "https://pub.dev/api/search?page=2"
@override@JsonKey(name: 'next') final  String? nextPageUrl;

/// Create a copy of GetSearchedPackagesResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetSearchedPackagesResponseBodyCopyWith<_GetSearchedPackagesResponseBody> get copyWith => __$GetSearchedPackagesResponseBodyCopyWithImpl<_GetSearchedPackagesResponseBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetSearchedPackagesResponseBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSearchedPackagesResponseBody&&const DeepCollectionEquality().equals(other._packages, _packages)&&(identical(other.nextPageUrl, nextPageUrl) || other.nextPageUrl == nextPageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages),nextPageUrl);

@override
String toString() {
  return 'GetSearchedPackagesResponseBody(packages: $packages, nextPageUrl: $nextPageUrl)';
}


}

/// @nodoc
abstract mixin class _$GetSearchedPackagesResponseBodyCopyWith<$Res> implements $GetSearchedPackagesResponseBodyCopyWith<$Res> {
  factory _$GetSearchedPackagesResponseBodyCopyWith(_GetSearchedPackagesResponseBody value, $Res Function(_GetSearchedPackagesResponseBody) _then) = __$GetSearchedPackagesResponseBodyCopyWithImpl;
@override @useResult
$Res call({
 List<PackageName> packages,@JsonKey(name: 'next') String? nextPageUrl
});




}
/// @nodoc
class __$GetSearchedPackagesResponseBodyCopyWithImpl<$Res>
    implements _$GetSearchedPackagesResponseBodyCopyWith<$Res> {
  __$GetSearchedPackagesResponseBodyCopyWithImpl(this._self, this._then);

  final _GetSearchedPackagesResponseBody _self;
  final $Res Function(_GetSearchedPackagesResponseBody) _then;

/// Create a copy of GetSearchedPackagesResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? packages = null,Object? nextPageUrl = freezed,}) {
  return _then(_GetSearchedPackagesResponseBody(
packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageName>,nextPageUrl: freezed == nextPageUrl ? _self.nextPageUrl : nextPageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
