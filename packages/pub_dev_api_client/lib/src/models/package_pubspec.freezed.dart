// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_pubspec.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PackagePubspec _$PackagePubspecFromJson(Map<String, dynamic> json) {
  return _PackagePubspec.fromJson(json);
}

/// @nodoc
mixin _$PackagePubspec {
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this PackagePubspec to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackagePubspec
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackagePubspecCopyWith<PackagePubspec> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagePubspecCopyWith<$Res> {
  factory $PackagePubspecCopyWith(
    PackagePubspec value,
    $Res Function(PackagePubspec) then,
  ) = _$PackagePubspecCopyWithImpl<$Res, PackagePubspec>;
  @useResult
  $Res call({String name, String version, String description});
}

/// @nodoc
class _$PackagePubspecCopyWithImpl<$Res, $Val extends PackagePubspec>
    implements $PackagePubspecCopyWith<$Res> {
  _$PackagePubspecCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackagePubspec
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PackagePubspecImplCopyWith<$Res>
    implements $PackagePubspecCopyWith<$Res> {
  factory _$$PackagePubspecImplCopyWith(
    _$PackagePubspecImpl value,
    $Res Function(_$PackagePubspecImpl) then,
  ) = __$$PackagePubspecImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String version, String description});
}

/// @nodoc
class __$$PackagePubspecImplCopyWithImpl<$Res>
    extends _$PackagePubspecCopyWithImpl<$Res, _$PackagePubspecImpl>
    implements _$$PackagePubspecImplCopyWith<$Res> {
  __$$PackagePubspecImplCopyWithImpl(
    _$PackagePubspecImpl _value,
    $Res Function(_$PackagePubspecImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PackagePubspec
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? version = null,
    Object? description = null,
  }) {
    return _then(
      _$PackagePubspecImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagePubspecImpl implements _PackagePubspec {
  const _$PackagePubspecImpl({
    required this.name,
    required this.version,
    required this.description,
  });

  factory _$PackagePubspecImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagePubspecImplFromJson(json);

  @override
  final String name;
  @override
  final String version;
  @override
  final String description;

  @override
  String toString() {
    return 'PackagePubspec(name: $name, version: $version, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackagePubspecImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, version, description);

  /// Create a copy of PackagePubspec
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagePubspecImplCopyWith<_$PackagePubspecImpl> get copyWith =>
      __$$PackagePubspecImplCopyWithImpl<_$PackagePubspecImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagePubspecImplToJson(this);
  }
}

abstract class _PackagePubspec implements PackagePubspec {
  const factory _PackagePubspec({
    required final String name,
    required final String version,
    required final String description,
  }) = _$PackagePubspecImpl;

  factory _PackagePubspec.fromJson(Map<String, dynamic> json) =
      _$PackagePubspecImpl.fromJson;

  @override
  String get name;
  @override
  String get version;
  @override
  String get description;

  /// Create a copy of PackagePubspec
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackagePubspecImplCopyWith<_$PackagePubspecImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
