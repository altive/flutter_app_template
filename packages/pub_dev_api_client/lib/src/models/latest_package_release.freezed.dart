// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latest_package_release.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LatestPackageRelease _$LatestPackageReleaseFromJson(Map<String, dynamic> json) {
  return _LatestPackageRelease.fromJson(json);
}

/// @nodoc
mixin _$LatestPackageRelease {
  PackagePubspec get pubspec => throw _privateConstructorUsedError;

  /// Serializes this LatestPackageRelease to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatestPackageReleaseCopyWith<LatestPackageRelease> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatestPackageReleaseCopyWith<$Res> {
  factory $LatestPackageReleaseCopyWith(
    LatestPackageRelease value,
    $Res Function(LatestPackageRelease) then,
  ) = _$LatestPackageReleaseCopyWithImpl<$Res, LatestPackageRelease>;
  @useResult
  $Res call({PackagePubspec pubspec});

  $PackagePubspecCopyWith<$Res> get pubspec;
}

/// @nodoc
class _$LatestPackageReleaseCopyWithImpl<
  $Res,
  $Val extends LatestPackageRelease
>
    implements $LatestPackageReleaseCopyWith<$Res> {
  _$LatestPackageReleaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pubspec = null}) {
    return _then(
      _value.copyWith(
            pubspec:
                null == pubspec
                    ? _value.pubspec
                    : pubspec // ignore: cast_nullable_to_non_nullable
                        as PackagePubspec,
          )
          as $Val,
    );
  }

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PackagePubspecCopyWith<$Res> get pubspec {
    return $PackagePubspecCopyWith<$Res>(_value.pubspec, (value) {
      return _then(_value.copyWith(pubspec: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LatestPackageReleaseImplCopyWith<$Res>
    implements $LatestPackageReleaseCopyWith<$Res> {
  factory _$$LatestPackageReleaseImplCopyWith(
    _$LatestPackageReleaseImpl value,
    $Res Function(_$LatestPackageReleaseImpl) then,
  ) = __$$LatestPackageReleaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PackagePubspec pubspec});

  @override
  $PackagePubspecCopyWith<$Res> get pubspec;
}

/// @nodoc
class __$$LatestPackageReleaseImplCopyWithImpl<$Res>
    extends _$LatestPackageReleaseCopyWithImpl<$Res, _$LatestPackageReleaseImpl>
    implements _$$LatestPackageReleaseImplCopyWith<$Res> {
  __$$LatestPackageReleaseImplCopyWithImpl(
    _$LatestPackageReleaseImpl _value,
    $Res Function(_$LatestPackageReleaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? pubspec = null}) {
    return _then(
      _$LatestPackageReleaseImpl(
        pubspec:
            null == pubspec
                ? _value.pubspec
                : pubspec // ignore: cast_nullable_to_non_nullable
                    as PackagePubspec,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LatestPackageReleaseImpl implements _LatestPackageRelease {
  const _$LatestPackageReleaseImpl({required this.pubspec});

  factory _$LatestPackageReleaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatestPackageReleaseImplFromJson(json);

  @override
  final PackagePubspec pubspec;

  @override
  String toString() {
    return 'LatestPackageRelease(pubspec: $pubspec)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatestPackageReleaseImpl &&
            (identical(other.pubspec, pubspec) || other.pubspec == pubspec));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pubspec);

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatestPackageReleaseImplCopyWith<_$LatestPackageReleaseImpl>
  get copyWith =>
      __$$LatestPackageReleaseImplCopyWithImpl<_$LatestPackageReleaseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LatestPackageReleaseImplToJson(this);
  }
}

abstract class _LatestPackageRelease implements LatestPackageRelease {
  const factory _LatestPackageRelease({required final PackagePubspec pubspec}) =
      _$LatestPackageReleaseImpl;

  factory _LatestPackageRelease.fromJson(Map<String, dynamic> json) =
      _$LatestPackageReleaseImpl.fromJson;

  @override
  PackagePubspec get pubspec;

  /// Create a copy of LatestPackageRelease
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatestPackageReleaseImplCopyWith<_$LatestPackageReleaseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
