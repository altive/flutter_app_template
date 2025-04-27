// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_pubspec.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackagePubspec {

 String get name; String get version; String get description;
/// Create a copy of PackagePubspec
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackagePubspecCopyWith<PackagePubspec> get copyWith => _$PackagePubspecCopyWithImpl<PackagePubspec>(this as PackagePubspec, _$identity);

  /// Serializes this PackagePubspec to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackagePubspec&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,description);

@override
String toString() {
  return 'PackagePubspec(name: $name, version: $version, description: $description)';
}


}

/// @nodoc
abstract mixin class $PackagePubspecCopyWith<$Res>  {
  factory $PackagePubspecCopyWith(PackagePubspec value, $Res Function(PackagePubspec) _then) = _$PackagePubspecCopyWithImpl;
@useResult
$Res call({
 String name, String version, String description
});




}
/// @nodoc
class _$PackagePubspecCopyWithImpl<$Res>
    implements $PackagePubspecCopyWith<$Res> {
  _$PackagePubspecCopyWithImpl(this._self, this._then);

  final PackagePubspec _self;
  final $Res Function(PackagePubspec) _then;

/// Create a copy of PackagePubspec
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? version = null,Object? description = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PackagePubspec implements PackagePubspec {
  const _PackagePubspec({required this.name, required this.version, required this.description});
  factory _PackagePubspec.fromJson(Map<String, dynamic> json) => _$PackagePubspecFromJson(json);

@override final  String name;
@override final  String version;
@override final  String description;

/// Create a copy of PackagePubspec
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackagePubspecCopyWith<_PackagePubspec> get copyWith => __$PackagePubspecCopyWithImpl<_PackagePubspec>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackagePubspecToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackagePubspec&&(identical(other.name, name) || other.name == name)&&(identical(other.version, version) || other.version == version)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,version,description);

@override
String toString() {
  return 'PackagePubspec(name: $name, version: $version, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PackagePubspecCopyWith<$Res> implements $PackagePubspecCopyWith<$Res> {
  factory _$PackagePubspecCopyWith(_PackagePubspec value, $Res Function(_PackagePubspec) _then) = __$PackagePubspecCopyWithImpl;
@override @useResult
$Res call({
 String name, String version, String description
});




}
/// @nodoc
class __$PackagePubspecCopyWithImpl<$Res>
    implements _$PackagePubspecCopyWith<$Res> {
  __$PackagePubspecCopyWithImpl(this._self, this._then);

  final _PackagePubspec _self;
  final $Res Function(_PackagePubspec) _then;

/// Create a copy of PackagePubspec
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? version = null,Object? description = null,}) {
  return _then(_PackagePubspec(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
