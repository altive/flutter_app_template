// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_searched_packages_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSearchedPackagesResponseBody _$GetSearchedPackagesResponseBodyFromJson(
    Map<String, dynamic> json) {
  return _GetSearchedPackagesResponseBody.fromJson(json);
}

/// @nodoc
mixin _$GetSearchedPackagesResponseBody {
  List<PackageName> get packages =>
      throw _privateConstructorUsedError; // e.g. "https://pub.dev/api/search?page=2"
  @JsonKey(name: 'next')
  String? get nextPageUrl => throw _privateConstructorUsedError;

  /// Serializes this GetSearchedPackagesResponseBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSearchedPackagesResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSearchedPackagesResponseBodyCopyWith<GetSearchedPackagesResponseBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSearchedPackagesResponseBodyCopyWith<$Res> {
  factory $GetSearchedPackagesResponseBodyCopyWith(
          GetSearchedPackagesResponseBody value,
          $Res Function(GetSearchedPackagesResponseBody) then) =
      _$GetSearchedPackagesResponseBodyCopyWithImpl<$Res,
          GetSearchedPackagesResponseBody>;
  @useResult
  $Res call(
      {List<PackageName> packages, @JsonKey(name: 'next') String? nextPageUrl});
}

/// @nodoc
class _$GetSearchedPackagesResponseBodyCopyWithImpl<$Res,
        $Val extends GetSearchedPackagesResponseBody>
    implements $GetSearchedPackagesResponseBodyCopyWith<$Res> {
  _$GetSearchedPackagesResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSearchedPackagesResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packages = null,
    Object? nextPageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      packages: null == packages
          ? _value.packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<PackageName>,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSearchedPackagesResponseBodyImplCopyWith<$Res>
    implements $GetSearchedPackagesResponseBodyCopyWith<$Res> {
  factory _$$GetSearchedPackagesResponseBodyImplCopyWith(
          _$GetSearchedPackagesResponseBodyImpl value,
          $Res Function(_$GetSearchedPackagesResponseBodyImpl) then) =
      __$$GetSearchedPackagesResponseBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PackageName> packages, @JsonKey(name: 'next') String? nextPageUrl});
}

/// @nodoc
class __$$GetSearchedPackagesResponseBodyImplCopyWithImpl<$Res>
    extends _$GetSearchedPackagesResponseBodyCopyWithImpl<$Res,
        _$GetSearchedPackagesResponseBodyImpl>
    implements _$$GetSearchedPackagesResponseBodyImplCopyWith<$Res> {
  __$$GetSearchedPackagesResponseBodyImplCopyWithImpl(
      _$GetSearchedPackagesResponseBodyImpl _value,
      $Res Function(_$GetSearchedPackagesResponseBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSearchedPackagesResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packages = null,
    Object? nextPageUrl = freezed,
  }) {
    return _then(_$GetSearchedPackagesResponseBodyImpl(
      packages: null == packages
          ? _value._packages
          : packages // ignore: cast_nullable_to_non_nullable
              as List<PackageName>,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSearchedPackagesResponseBodyImpl
    extends _GetSearchedPackagesResponseBody with DiagnosticableTreeMixin {
  const _$GetSearchedPackagesResponseBodyImpl(
      {required final List<PackageName> packages,
      @JsonKey(name: 'next') this.nextPageUrl})
      : _packages = packages,
        super._();

  factory _$GetSearchedPackagesResponseBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetSearchedPackagesResponseBodyImplFromJson(json);

  final List<PackageName> _packages;
  @override
  List<PackageName> get packages {
    if (_packages is EqualUnmodifiableListView) return _packages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_packages);
  }

// e.g. "https://pub.dev/api/search?page=2"
  @override
  @JsonKey(name: 'next')
  final String? nextPageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetSearchedPackagesResponseBody(packages: $packages, nextPageUrl: $nextPageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetSearchedPackagesResponseBody'))
      ..add(DiagnosticsProperty('packages', packages))
      ..add(DiagnosticsProperty('nextPageUrl', nextPageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchedPackagesResponseBodyImpl &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_packages), nextPageUrl);

  /// Create a copy of GetSearchedPackagesResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchedPackagesResponseBodyImplCopyWith<
          _$GetSearchedPackagesResponseBodyImpl>
      get copyWith => __$$GetSearchedPackagesResponseBodyImplCopyWithImpl<
          _$GetSearchedPackagesResponseBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSearchedPackagesResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _GetSearchedPackagesResponseBody
    extends GetSearchedPackagesResponseBody {
  const factory _GetSearchedPackagesResponseBody(
          {required final List<PackageName> packages,
          @JsonKey(name: 'next') final String? nextPageUrl}) =
      _$GetSearchedPackagesResponseBodyImpl;
  const _GetSearchedPackagesResponseBody._() : super._();

  factory _GetSearchedPackagesResponseBody.fromJson(Map<String, dynamic> json) =
      _$GetSearchedPackagesResponseBodyImpl.fromJson;

  @override
  List<PackageName> get packages; // e.g. "https://pub.dev/api/search?page=2"
  @override
  @JsonKey(name: 'next')
  String? get nextPageUrl;

  /// Create a copy of GetSearchedPackagesResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchedPackagesResponseBodyImplCopyWith<
          _$GetSearchedPackagesResponseBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
