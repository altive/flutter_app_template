// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDevice {
  String get name => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get osVersionString => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(String name, String model, String osVersionString)
        macos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult? Function(String name, String model, String osVersionString)? macos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult Function(String name, String model, String osVersionString)? macos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndroidDevice value) android,
    required TResult Function(IosDevice value) ios,
    required TResult Function(MacosDevice value) macos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndroidDevice value)? android,
    TResult? Function(IosDevice value)? ios,
    TResult? Function(MacosDevice value)? macos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndroidDevice value)? android,
    TResult Function(IosDevice value)? ios,
    TResult Function(MacosDevice value)? macos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDeviceCopyWith<UserDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDeviceCopyWith<$Res> {
  factory $UserDeviceCopyWith(
          UserDevice value, $Res Function(UserDevice) then) =
      _$UserDeviceCopyWithImpl<$Res, UserDevice>;
  @useResult
  $Res call({String name, String model, String osVersionString});
}

/// @nodoc
class _$UserDeviceCopyWithImpl<$Res, $Val extends UserDevice>
    implements $UserDeviceCopyWith<$Res> {
  _$UserDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osVersionString = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      osVersionString: null == osVersionString
          ? _value.osVersionString
          : osVersionString // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidDeviceImplCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$AndroidDeviceImplCopyWith(
          _$AndroidDeviceImpl value, $Res Function(_$AndroidDeviceImpl) then) =
      __$$AndroidDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osName, String osVersionString});
}

/// @nodoc
class __$$AndroidDeviceImplCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$AndroidDeviceImpl>
    implements _$$AndroidDeviceImplCopyWith<$Res> {
  __$$AndroidDeviceImplCopyWithImpl(
      _$AndroidDeviceImpl _value, $Res Function(_$AndroidDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osName = null,
    Object? osVersionString = null,
  }) {
    return _then(_$AndroidDeviceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      osName: null == osName
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersionString: null == osVersionString
          ? _value.osVersionString
          : osVersionString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AndroidDeviceImpl extends AndroidDevice with DiagnosticableTreeMixin {
  const _$AndroidDeviceImpl(
      {required this.name,
      required this.model,
      required this.osName,
      required this.osVersionString})
      : super._();

  @override
  final String name;
  @override
  final String model;
  @override
  final String osName;
  @override
  final String osVersionString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDevice.android(name: $name, model: $model, osName: $osName, osVersionString: $osVersionString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDevice.android'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('osName', osName))
      ..add(DiagnosticsProperty('osVersionString', osVersionString));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidDeviceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osName, osName) || other.osName == osName) &&
            (identical(other.osVersionString, osVersionString) ||
                other.osVersionString == osVersionString));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, model, osName, osVersionString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidDeviceImplCopyWith<_$AndroidDeviceImpl> get copyWith =>
      __$$AndroidDeviceImplCopyWithImpl<_$AndroidDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(String name, String model, String osVersionString)
        macos,
  }) {
    return android(name, model, osName, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult? Function(String name, String model, String osVersionString)? macos,
  }) {
    return android?.call(name, model, osName, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult Function(String name, String model, String osVersionString)? macos,
    required TResult orElse(),
  }) {
    if (android != null) {
      return android(name, model, osName, osVersionString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndroidDevice value) android,
    required TResult Function(IosDevice value) ios,
    required TResult Function(MacosDevice value) macos,
  }) {
    return android(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndroidDevice value)? android,
    TResult? Function(IosDevice value)? ios,
    TResult? Function(MacosDevice value)? macos,
  }) {
    return android?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndroidDevice value)? android,
    TResult Function(IosDevice value)? ios,
    TResult Function(MacosDevice value)? macos,
    required TResult orElse(),
  }) {
    if (android != null) {
      return android(this);
    }
    return orElse();
  }
}

abstract class AndroidDevice extends UserDevice {
  const factory AndroidDevice(
      {required final String name,
      required final String model,
      required final String osName,
      required final String osVersionString}) = _$AndroidDeviceImpl;
  const AndroidDevice._() : super._();

  @override
  String get name;
  @override
  String get model;
  String get osName;
  @override
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$AndroidDeviceImplCopyWith<_$AndroidDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IosDeviceImplCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$IosDeviceImplCopyWith(
          _$IosDeviceImpl value, $Res Function(_$IosDeviceImpl) then) =
      __$$IosDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osName, String osVersionString});
}

/// @nodoc
class __$$IosDeviceImplCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$IosDeviceImpl>
    implements _$$IosDeviceImplCopyWith<$Res> {
  __$$IosDeviceImplCopyWithImpl(
      _$IosDeviceImpl _value, $Res Function(_$IosDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osName = null,
    Object? osVersionString = null,
  }) {
    return _then(_$IosDeviceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      osName: null == osName
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersionString: null == osVersionString
          ? _value.osVersionString
          : osVersionString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IosDeviceImpl extends IosDevice with DiagnosticableTreeMixin {
  const _$IosDeviceImpl(
      {required this.name,
      required this.model,
      required this.osName,
      required this.osVersionString})
      : super._();

  @override
  final String name;
  @override
  final String model;
  @override
  final String osName;
  @override
  final String osVersionString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDevice.ios(name: $name, model: $model, osName: $osName, osVersionString: $osVersionString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDevice.ios'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('osName', osName))
      ..add(DiagnosticsProperty('osVersionString', osVersionString));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IosDeviceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osName, osName) || other.osName == osName) &&
            (identical(other.osVersionString, osVersionString) ||
                other.osVersionString == osVersionString));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, model, osName, osVersionString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IosDeviceImplCopyWith<_$IosDeviceImpl> get copyWith =>
      __$$IosDeviceImplCopyWithImpl<_$IosDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(String name, String model, String osVersionString)
        macos,
  }) {
    return ios(name, model, osName, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult? Function(String name, String model, String osVersionString)? macos,
  }) {
    return ios?.call(name, model, osName, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult Function(String name, String model, String osVersionString)? macos,
    required TResult orElse(),
  }) {
    if (ios != null) {
      return ios(name, model, osName, osVersionString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndroidDevice value) android,
    required TResult Function(IosDevice value) ios,
    required TResult Function(MacosDevice value) macos,
  }) {
    return ios(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndroidDevice value)? android,
    TResult? Function(IosDevice value)? ios,
    TResult? Function(MacosDevice value)? macos,
  }) {
    return ios?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndroidDevice value)? android,
    TResult Function(IosDevice value)? ios,
    TResult Function(MacosDevice value)? macos,
    required TResult orElse(),
  }) {
    if (ios != null) {
      return ios(this);
    }
    return orElse();
  }
}

abstract class IosDevice extends UserDevice {
  const factory IosDevice(
      {required final String name,
      required final String model,
      required final String osName,
      required final String osVersionString}) = _$IosDeviceImpl;
  const IosDevice._() : super._();

  @override
  String get name;
  @override
  String get model;
  String get osName;
  @override
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$IosDeviceImplCopyWith<_$IosDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MacosDeviceImplCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$MacosDeviceImplCopyWith(
          _$MacosDeviceImpl value, $Res Function(_$MacosDeviceImpl) then) =
      __$$MacosDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osVersionString});
}

/// @nodoc
class __$$MacosDeviceImplCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$MacosDeviceImpl>
    implements _$$MacosDeviceImplCopyWith<$Res> {
  __$$MacosDeviceImplCopyWithImpl(
      _$MacosDeviceImpl _value, $Res Function(_$MacosDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osVersionString = null,
  }) {
    return _then(_$MacosDeviceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      osVersionString: null == osVersionString
          ? _value.osVersionString
          : osVersionString // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MacosDeviceImpl extends MacosDevice with DiagnosticableTreeMixin {
  const _$MacosDeviceImpl(
      {required this.name, required this.model, required this.osVersionString})
      : super._();

  /// Altive's MacBook Air
  @override
  final String name;

  /// example: Mac14,2
  @override
  final String model;

  /// example: Version 14.2.1 (Build 23C71)
  @override
  final String osVersionString;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserDevice.macos(name: $name, model: $model, osVersionString: $osVersionString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDevice.macos'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('osVersionString', osVersionString));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacosDeviceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.osVersionString, osVersionString) ||
                other.osVersionString == osVersionString));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, model, osVersionString);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MacosDeviceImplCopyWith<_$MacosDeviceImpl> get copyWith =>
      __$$MacosDeviceImplCopyWithImpl<_$MacosDeviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(String name, String model, String osVersionString)
        macos,
  }) {
    return macos(name, model, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult? Function(String name, String model, String osVersionString)? macos,
  }) {
    return macos?.call(name, model, osVersionString);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        android,
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        ios,
    TResult Function(String name, String model, String osVersionString)? macos,
    required TResult orElse(),
  }) {
    if (macos != null) {
      return macos(name, model, osVersionString);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AndroidDevice value) android,
    required TResult Function(IosDevice value) ios,
    required TResult Function(MacosDevice value) macos,
  }) {
    return macos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AndroidDevice value)? android,
    TResult? Function(IosDevice value)? ios,
    TResult? Function(MacosDevice value)? macos,
  }) {
    return macos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AndroidDevice value)? android,
    TResult Function(IosDevice value)? ios,
    TResult Function(MacosDevice value)? macos,
    required TResult orElse(),
  }) {
    if (macos != null) {
      return macos(this);
    }
    return orElse();
  }
}

abstract class MacosDevice extends UserDevice {
  const factory MacosDevice(
      {required final String name,
      required final String model,
      required final String osVersionString}) = _$MacosDeviceImpl;
  const MacosDevice._() : super._();

  @override

  /// Altive's MacBook Air
  String get name;
  @override

  /// example: Mac14,2
  String get model;
  @override

  /// example: Version 14.2.1 (Build 23C71)
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$MacosDeviceImplCopyWith<_$MacosDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
