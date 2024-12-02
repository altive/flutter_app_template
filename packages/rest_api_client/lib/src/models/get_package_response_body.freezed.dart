// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_package_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPackageResponseBody _$GetPackageResponseBodyFromJson(
    Map<String, dynamic> json) {
  return _GetPackageResponseBody.fromJson(json);
}

/// @nodoc
mixin _$GetPackageResponseBody {
  String get name => throw _privateConstructorUsedError;
  LatestPackageRelease get latest => throw _privateConstructorUsedError;

  /// Serializes this GetPackageResponseBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPackageResponseBodyCopyWith<GetPackageResponseBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPackageResponseBodyCopyWith<$Res> {
  factory $GetPackageResponseBodyCopyWith(GetPackageResponseBody value,
          $Res Function(GetPackageResponseBody) then) =
      _$GetPackageResponseBodyCopyWithImpl<$Res, GetPackageResponseBody>;
  @useResult
  $Res call({String name, LatestPackageRelease latest});

  $LatestPackageReleaseCopyWith<$Res> get latest;
}

/// @nodoc
class _$GetPackageResponseBodyCopyWithImpl<$Res,
        $Val extends GetPackageResponseBody>
    implements $GetPackageResponseBodyCopyWith<$Res> {
  _$GetPackageResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latest = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as LatestPackageRelease,
    ) as $Val);
  }

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LatestPackageReleaseCopyWith<$Res> get latest {
    return $LatestPackageReleaseCopyWith<$Res>(_value.latest, (value) {
      return _then(_value.copyWith(latest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetPackageResponseBodyImplCopyWith<$Res>
    implements $GetPackageResponseBodyCopyWith<$Res> {
  factory _$$GetPackageResponseBodyImplCopyWith(
          _$GetPackageResponseBodyImpl value,
          $Res Function(_$GetPackageResponseBodyImpl) then) =
      __$$GetPackageResponseBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, LatestPackageRelease latest});

  @override
  $LatestPackageReleaseCopyWith<$Res> get latest;
}

/// @nodoc
class __$$GetPackageResponseBodyImplCopyWithImpl<$Res>
    extends _$GetPackageResponseBodyCopyWithImpl<$Res,
        _$GetPackageResponseBodyImpl>
    implements _$$GetPackageResponseBodyImplCopyWith<$Res> {
  __$$GetPackageResponseBodyImplCopyWithImpl(
      _$GetPackageResponseBodyImpl _value,
      $Res Function(_$GetPackageResponseBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latest = null,
  }) {
    return _then(_$GetPackageResponseBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      latest: null == latest
          ? _value.latest
          : latest // ignore: cast_nullable_to_non_nullable
              as LatestPackageRelease,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPackageResponseBodyImpl
    with DiagnosticableTreeMixin
    implements _GetPackageResponseBody {
  const _$GetPackageResponseBodyImpl(
      {required this.name, required this.latest});

  factory _$GetPackageResponseBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPackageResponseBodyImplFromJson(json);

  @override
  final String name;
  @override
  final LatestPackageRelease latest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetPackageResponseBody(name: $name, latest: $latest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetPackageResponseBody'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('latest', latest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPackageResponseBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latest, latest) || other.latest == latest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latest);

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPackageResponseBodyImplCopyWith<_$GetPackageResponseBodyImpl>
      get copyWith => __$$GetPackageResponseBodyImplCopyWithImpl<
          _$GetPackageResponseBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPackageResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _GetPackageResponseBody implements GetPackageResponseBody {
  const factory _GetPackageResponseBody(
          {required final String name,
          required final LatestPackageRelease latest}) =
      _$GetPackageResponseBodyImpl;

  factory _GetPackageResponseBody.fromJson(Map<String, dynamic> json) =
      _$GetPackageResponseBodyImpl.fromJson;

  @override
  String get name;
  @override
  LatestPackageRelease get latest;

  /// Create a copy of GetPackageResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPackageResponseBodyImplCopyWith<_$GetPackageResponseBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
