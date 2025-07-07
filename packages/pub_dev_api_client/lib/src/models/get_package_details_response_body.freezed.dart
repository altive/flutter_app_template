// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_package_details_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPackageDetailsResponseBody {

 String get name; LatestPackageRelease get latest;
/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPackageDetailsResponseBodyCopyWith<GetPackageDetailsResponseBody> get copyWith => _$GetPackageDetailsResponseBodyCopyWithImpl<GetPackageDetailsResponseBody>(this as GetPackageDetailsResponseBody, _$identity);

  /// Serializes this GetPackageDetailsResponseBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPackageDetailsResponseBody&&(identical(other.name, name) || other.name == name)&&(identical(other.latest, latest) || other.latest == latest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latest);

@override
String toString() {
  return 'GetPackageDetailsResponseBody(name: $name, latest: $latest)';
}


}

/// @nodoc
abstract mixin class $GetPackageDetailsResponseBodyCopyWith<$Res>  {
  factory $GetPackageDetailsResponseBodyCopyWith(GetPackageDetailsResponseBody value, $Res Function(GetPackageDetailsResponseBody) _then) = _$GetPackageDetailsResponseBodyCopyWithImpl;
@useResult
$Res call({
 String name, LatestPackageRelease latest
});


$LatestPackageReleaseCopyWith<$Res> get latest;

}
/// @nodoc
class _$GetPackageDetailsResponseBodyCopyWithImpl<$Res>
    implements $GetPackageDetailsResponseBodyCopyWith<$Res> {
  _$GetPackageDetailsResponseBodyCopyWithImpl(this._self, this._then);

  final GetPackageDetailsResponseBody _self;
  final $Res Function(GetPackageDetailsResponseBody) _then;

/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? latest = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latest: null == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as LatestPackageRelease,
  ));
}
/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatestPackageReleaseCopyWith<$Res> get latest {
  
  return $LatestPackageReleaseCopyWith<$Res>(_self.latest, (value) {
    return _then(_self.copyWith(latest: value));
  });
}
}


/// Adds pattern-matching-related methods to [GetPackageDetailsResponseBody].
extension GetPackageDetailsResponseBodyPatterns on GetPackageDetailsResponseBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPackageDetailsResponseBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPackageDetailsResponseBody value)  $default,){
final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPackageDetailsResponseBody value)?  $default,){
final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  LatestPackageRelease latest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody() when $default != null:
return $default(_that.name,_that.latest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  LatestPackageRelease latest)  $default,) {final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody():
return $default(_that.name,_that.latest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  LatestPackageRelease latest)?  $default,) {final _that = this;
switch (_that) {
case _GetPackageDetailsResponseBody() when $default != null:
return $default(_that.name,_that.latest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPackageDetailsResponseBody implements GetPackageDetailsResponseBody {
  const _GetPackageDetailsResponseBody({required this.name, required this.latest});
  factory _GetPackageDetailsResponseBody.fromJson(Map<String, dynamic> json) => _$GetPackageDetailsResponseBodyFromJson(json);

@override final  String name;
@override final  LatestPackageRelease latest;

/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPackageDetailsResponseBodyCopyWith<_GetPackageDetailsResponseBody> get copyWith => __$GetPackageDetailsResponseBodyCopyWithImpl<_GetPackageDetailsResponseBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPackageDetailsResponseBodyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPackageDetailsResponseBody&&(identical(other.name, name) || other.name == name)&&(identical(other.latest, latest) || other.latest == latest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,latest);

@override
String toString() {
  return 'GetPackageDetailsResponseBody(name: $name, latest: $latest)';
}


}

/// @nodoc
abstract mixin class _$GetPackageDetailsResponseBodyCopyWith<$Res> implements $GetPackageDetailsResponseBodyCopyWith<$Res> {
  factory _$GetPackageDetailsResponseBodyCopyWith(_GetPackageDetailsResponseBody value, $Res Function(_GetPackageDetailsResponseBody) _then) = __$GetPackageDetailsResponseBodyCopyWithImpl;
@override @useResult
$Res call({
 String name, LatestPackageRelease latest
});


@override $LatestPackageReleaseCopyWith<$Res> get latest;

}
/// @nodoc
class __$GetPackageDetailsResponseBodyCopyWithImpl<$Res>
    implements _$GetPackageDetailsResponseBodyCopyWith<$Res> {
  __$GetPackageDetailsResponseBodyCopyWithImpl(this._self, this._then);

  final _GetPackageDetailsResponseBody _self;
  final $Res Function(_GetPackageDetailsResponseBody) _then;

/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? latest = null,}) {
  return _then(_GetPackageDetailsResponseBody(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latest: null == latest ? _self.latest : latest // ignore: cast_nullable_to_non_nullable
as LatestPackageRelease,
  ));
}

/// Create a copy of GetPackageDetailsResponseBody
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatestPackageReleaseCopyWith<$Res> get latest {
  
  return $LatestPackageReleaseCopyWith<$Res>(_self.latest, (value) {
    return _then(_self.copyWith(latest: value));
  });
}
}

// dart format on
