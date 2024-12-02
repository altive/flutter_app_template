// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_search_response_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetSearchResponseBody _$GetSearchResponseBodyFromJson(
    Map<String, dynamic> json) {
  return _GetSearchResponseBody.fromJson(json);
}

/// @nodoc
mixin _$GetSearchResponseBody {
  List<PackageName> get packages =>
      throw _privateConstructorUsedError; // e.g. "https://pub.dev/api/search?page=2"
  @JsonKey(name: 'next')
  String? get nextPageUrl => throw _privateConstructorUsedError;

  /// Serializes this GetSearchResponseBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSearchResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSearchResponseBodyCopyWith<GetSearchResponseBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSearchResponseBodyCopyWith<$Res> {
  factory $GetSearchResponseBodyCopyWith(GetSearchResponseBody value,
          $Res Function(GetSearchResponseBody) then) =
      _$GetSearchResponseBodyCopyWithImpl<$Res, GetSearchResponseBody>;
  @useResult
  $Res call(
      {List<PackageName> packages, @JsonKey(name: 'next') String? nextPageUrl});
}

/// @nodoc
class _$GetSearchResponseBodyCopyWithImpl<$Res,
        $Val extends GetSearchResponseBody>
    implements $GetSearchResponseBodyCopyWith<$Res> {
  _$GetSearchResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSearchResponseBody
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
abstract class _$$GetSearchResponseBodyImplCopyWith<$Res>
    implements $GetSearchResponseBodyCopyWith<$Res> {
  factory _$$GetSearchResponseBodyImplCopyWith(
          _$GetSearchResponseBodyImpl value,
          $Res Function(_$GetSearchResponseBodyImpl) then) =
      __$$GetSearchResponseBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PackageName> packages, @JsonKey(name: 'next') String? nextPageUrl});
}

/// @nodoc
class __$$GetSearchResponseBodyImplCopyWithImpl<$Res>
    extends _$GetSearchResponseBodyCopyWithImpl<$Res,
        _$GetSearchResponseBodyImpl>
    implements _$$GetSearchResponseBodyImplCopyWith<$Res> {
  __$$GetSearchResponseBodyImplCopyWithImpl(_$GetSearchResponseBodyImpl _value,
      $Res Function(_$GetSearchResponseBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSearchResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packages = null,
    Object? nextPageUrl = freezed,
  }) {
    return _then(_$GetSearchResponseBodyImpl(
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
class _$GetSearchResponseBodyImpl extends _GetSearchResponseBody
    with DiagnosticableTreeMixin {
  const _$GetSearchResponseBodyImpl(
      {required final List<PackageName> packages,
      @JsonKey(name: 'next') this.nextPageUrl})
      : _packages = packages,
        super._();

  factory _$GetSearchResponseBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSearchResponseBodyImplFromJson(json);

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
    return 'GetSearchResponseBody(packages: $packages, nextPageUrl: $nextPageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetSearchResponseBody'))
      ..add(DiagnosticsProperty('packages', packages))
      ..add(DiagnosticsProperty('nextPageUrl', nextPageUrl));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchResponseBodyImpl &&
            const DeepCollectionEquality().equals(other._packages, _packages) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_packages), nextPageUrl);

  /// Create a copy of GetSearchResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchResponseBodyImplCopyWith<_$GetSearchResponseBodyImpl>
      get copyWith => __$$GetSearchResponseBodyImplCopyWithImpl<
          _$GetSearchResponseBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSearchResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _GetSearchResponseBody extends GetSearchResponseBody {
  const factory _GetSearchResponseBody(
          {required final List<PackageName> packages,
          @JsonKey(name: 'next') final String? nextPageUrl}) =
      _$GetSearchResponseBodyImpl;
  const _GetSearchResponseBody._() : super._();

  factory _GetSearchResponseBody.fromJson(Map<String, dynamic> json) =
      _$GetSearchResponseBodyImpl.fromJson;

  @override
  List<PackageName> get packages; // e.g. "https://pub.dev/api/search?page=2"
  @override
  @JsonKey(name: 'next')
  String? get nextPageUrl;

  /// Create a copy of GetSearchResponseBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchResponseBodyImplCopyWith<_$GetSearchResponseBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
