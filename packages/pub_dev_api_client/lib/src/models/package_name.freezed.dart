// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageName _$PackageNameFromJson(Map<String, dynamic> json) {
  return _PackageName.fromJson(json);
}

/// @nodoc
mixin _$PackageName {
  @JsonKey(name: 'package')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this PackageName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageNameCopyWith<PackageName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageNameCopyWith<$Res> {
  factory $PackageNameCopyWith(
          PackageName value, $Res Function(PackageName) then) =
      _$PackageNameCopyWithImpl<$Res, PackageName>;
  @useResult
  $Res call({@JsonKey(name: 'package') String name});
}

/// @nodoc
class _$PackageNameCopyWithImpl<$Res, $Val extends PackageName>
    implements $PackageNameCopyWith<$Res> {
  _$PackageNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageNameImplCopyWith<$Res>
    implements $PackageNameCopyWith<$Res> {
  factory _$$PackageNameImplCopyWith(
          _$PackageNameImpl value, $Res Function(_$PackageNameImpl) then) =
      __$$PackageNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'package') String name});
}

/// @nodoc
class __$$PackageNameImplCopyWithImpl<$Res>
    extends _$PackageNameCopyWithImpl<$Res, _$PackageNameImpl>
    implements _$$PackageNameImplCopyWith<$Res> {
  __$$PackageNameImplCopyWithImpl(
      _$PackageNameImpl _value, $Res Function(_$PackageNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$PackageNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageNameImpl with DiagnosticableTreeMixin implements _PackageName {
  const _$PackageNameImpl({@JsonKey(name: 'package') required this.name});

  factory _$PackageNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageNameImplFromJson(json);

  @override
  @JsonKey(name: 'package')
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PackageName(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PackageName'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of PackageName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageNameImplCopyWith<_$PackageNameImpl> get copyWith =>
      __$$PackageNameImplCopyWithImpl<_$PackageNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageNameImplToJson(
      this,
    );
  }
}

abstract class _PackageName implements PackageName {
  const factory _PackageName(
          {@JsonKey(name: 'package') required final String name}) =
      _$PackageNameImpl;

  factory _PackageName.fromJson(Map<String, dynamic> json) =
      _$PackageNameImpl.fromJson;

  @override
  @JsonKey(name: 'package')
  String get name;

  /// Create a copy of PackageName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageNameImplCopyWith<_$PackageNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
