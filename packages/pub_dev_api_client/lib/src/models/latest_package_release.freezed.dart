// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [LatestPackageRelease].
extension LatestPackageReleasePatterns on LatestPackageRelease {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LatestPackageRelease value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LatestPackageRelease() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LatestPackageRelease value)  $default,){
final _that = this;
switch (_that) {
case _LatestPackageRelease():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LatestPackageRelease value)?  $default,){
final _that = this;
switch (_that) {
case _LatestPackageRelease() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PackagePubspec pubspec)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LatestPackageRelease() when $default != null:
return $default(_that.pubspec);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PackagePubspec pubspec)  $default,) {final _that = this;
switch (_that) {
case _LatestPackageRelease():
return $default(_that.pubspec);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PackagePubspec pubspec)?  $default,) {final _that = this;
switch (_that) {
case _LatestPackageRelease() when $default != null:
return $default(_that.pubspec);case _:
  return null;

}
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
