// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageName {

@JsonKey(name: 'package') String get name;
/// Create a copy of PackageName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageNameCopyWith<PackageName> get copyWith => _$PackageNameCopyWithImpl<PackageName>(this as PackageName, _$identity);

  /// Serializes this PackageName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PackageName(name: $name)';
}


}

/// @nodoc
abstract mixin class $PackageNameCopyWith<$Res>  {
  factory $PackageNameCopyWith(PackageName value, $Res Function(PackageName) _then) = _$PackageNameCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'package') String name
});




}
/// @nodoc
class _$PackageNameCopyWithImpl<$Res>
    implements $PackageNameCopyWith<$Res> {
  _$PackageNameCopyWithImpl(this._self, this._then);

  final PackageName _self;
  final $Res Function(PackageName) _then;

/// Create a copy of PackageName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageName].
extension PackageNamePatterns on PackageName {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageName() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageName value)  $default,){
final _that = this;
switch (_that) {
case _PackageName():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageName value)?  $default,){
final _that = this;
switch (_that) {
case _PackageName() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'package')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageName() when $default != null:
return $default(_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'package')  String name)  $default,) {final _that = this;
switch (_that) {
case _PackageName():
return $default(_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'package')  String name)?  $default,) {final _that = this;
switch (_that) {
case _PackageName() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageName implements PackageName {
  const _PackageName({@JsonKey(name: 'package') required this.name});
  factory _PackageName.fromJson(Map<String, dynamic> json) => _$PackageNameFromJson(json);

@override@JsonKey(name: 'package') final  String name;

/// Create a copy of PackageName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageNameCopyWith<_PackageName> get copyWith => __$PackageNameCopyWithImpl<_PackageName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageName&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'PackageName(name: $name)';
}


}

/// @nodoc
abstract mixin class _$PackageNameCopyWith<$Res> implements $PackageNameCopyWith<$Res> {
  factory _$PackageNameCopyWith(_PackageName value, $Res Function(_PackageName) _then) = __$PackageNameCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'package') String name
});




}
/// @nodoc
class __$PackageNameCopyWithImpl<$Res>
    implements _$PackageNameCopyWith<$Res> {
  __$PackageNameCopyWithImpl(this._self, this._then);

  final _PackageName _self;
  final $Res Function(_PackageName) _then;

/// Create a copy of PackageName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_PackageName(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
