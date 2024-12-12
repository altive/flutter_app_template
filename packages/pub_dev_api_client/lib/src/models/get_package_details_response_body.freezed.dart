// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_package_details_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPackageDetailsResponseBody _$GetPackageDetailsResponseBodyFromJson(
    Map<String, dynamic> json) {
  return _GetPackageDetailsResponseBody.fromJson(json);
}

/// @nodoc
mixin _$GetPackageDetailsResponseBody {
  String get name => throw _privateConstructorUsedError;
  LatestPackageRelease get latest => throw _privateConstructorUsedError;

  /// Serializes this GetPackageDetailsResponseBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetPackageDetailsResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPackageDetailsResponseBodyCopyWith<GetPackageDetailsResponseBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPackageDetailsResponseBodyCopyWith<$Res> {
  factory $GetPackageDetailsResponseBodyCopyWith(
          GetPackageDetailsResponseBody value,
          $Res Function(GetPackageDetailsResponseBody) then) =
      _$GetPackageDetailsResponseBodyCopyWithImpl<$Res,
          GetPackageDetailsResponseBody>;
  @useResult
  $Res call({String name, LatestPackageRelease latest});

  $LatestPackageReleaseCopyWith<$Res> get latest;
}

/// @nodoc
class _$GetPackageDetailsResponseBodyCopyWithImpl<$Res,
        $Val extends GetPackageDetailsResponseBody>
    implements $GetPackageDetailsResponseBodyCopyWith<$Res> {
  _$GetPackageDetailsResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPackageDetailsResponseBody
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

  /// Create a copy of GetPackageDetailsResponseBody
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
abstract class _$$GetPackageDetailsResponseBodyImplCopyWith<$Res>
    implements $GetPackageDetailsResponseBodyCopyWith<$Res> {
  factory _$$GetPackageDetailsResponseBodyImplCopyWith(
          _$GetPackageDetailsResponseBodyImpl value,
          $Res Function(_$GetPackageDetailsResponseBodyImpl) then) =
      __$$GetPackageDetailsResponseBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, LatestPackageRelease latest});

  @override
  $LatestPackageReleaseCopyWith<$Res> get latest;
}

/// @nodoc
class __$$GetPackageDetailsResponseBodyImplCopyWithImpl<$Res>
    extends _$GetPackageDetailsResponseBodyCopyWithImpl<$Res,
        _$GetPackageDetailsResponseBodyImpl>
    implements _$$GetPackageDetailsResponseBodyImplCopyWith<$Res> {
  __$$GetPackageDetailsResponseBodyImplCopyWithImpl(
      _$GetPackageDetailsResponseBodyImpl _value,
      $Res Function(_$GetPackageDetailsResponseBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetPackageDetailsResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? latest = null,
  }) {
    return _then(_$GetPackageDetailsResponseBodyImpl(
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
class _$GetPackageDetailsResponseBodyImpl
    with DiagnosticableTreeMixin
    implements _GetPackageDetailsResponseBody {
  const _$GetPackageDetailsResponseBodyImpl(
      {required this.name, required this.latest});

  factory _$GetPackageDetailsResponseBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetPackageDetailsResponseBodyImplFromJson(json);

  @override
  final String name;
  @override
  final LatestPackageRelease latest;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetPackageDetailsResponseBody(name: $name, latest: $latest)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetPackageDetailsResponseBody'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('latest', latest));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPackageDetailsResponseBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latest, latest) || other.latest == latest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, latest);

  /// Create a copy of GetPackageDetailsResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPackageDetailsResponseBodyImplCopyWith<
          _$GetPackageDetailsResponseBodyImpl>
      get copyWith => __$$GetPackageDetailsResponseBodyImplCopyWithImpl<
          _$GetPackageDetailsResponseBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPackageDetailsResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _GetPackageDetailsResponseBody
    implements GetPackageDetailsResponseBody {
  const factory _GetPackageDetailsResponseBody(
          {required final String name,
          required final LatestPackageRelease latest}) =
      _$GetPackageDetailsResponseBodyImpl;

  factory _GetPackageDetailsResponseBody.fromJson(Map<String, dynamic> json) =
      _$GetPackageDetailsResponseBodyImpl.fromJson;

  @override
  String get name;
  @override
  LatestPackageRelease get latest;

  /// Create a copy of GetPackageDetailsResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPackageDetailsResponseBodyImplCopyWith<
          _$GetPackageDetailsResponseBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
