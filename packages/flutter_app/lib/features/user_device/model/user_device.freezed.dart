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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDevice {
  String get name => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get osName => throw _privateConstructorUsedError;
  String get osVersionString => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
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
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
  $Res call({String name, String model, String osName, String osVersionString});
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
    Object? osName = null,
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
      osName: null == osName
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersionString: null == osVersionString
          ? _value.osVersionString
          : osVersionString // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidDeviceCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$AndroidDeviceCopyWith(
          _$AndroidDevice value, $Res Function(_$AndroidDevice) then) =
      __$$AndroidDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osName, String osVersionString});
}

/// @nodoc
class __$$AndroidDeviceCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$AndroidDevice>
    implements _$$AndroidDeviceCopyWith<$Res> {
  __$$AndroidDeviceCopyWithImpl(
      _$AndroidDevice _value, $Res Function(_$AndroidDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osName = null,
    Object? osVersionString = null,
  }) {
    return _then(_$AndroidDevice(
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

class _$AndroidDevice extends AndroidDevice with DiagnosticableTreeMixin {
  const _$AndroidDevice(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidDevice &&
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
  _$$AndroidDeviceCopyWith<_$AndroidDevice> get copyWith =>
      __$$AndroidDeviceCopyWithImpl<_$AndroidDevice>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
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
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
      required final String osVersionString}) = _$AndroidDevice;
  const AndroidDevice._() : super._();

  @override
  String get name;
  @override
  String get model;
  @override
  String get osName;
  @override
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$AndroidDeviceCopyWith<_$AndroidDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IosDeviceCopyWith<$Res> implements $UserDeviceCopyWith<$Res> {
  factory _$$IosDeviceCopyWith(
          _$IosDevice value, $Res Function(_$IosDevice) then) =
      __$$IosDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osName, String osVersionString});
}

/// @nodoc
class __$$IosDeviceCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$IosDevice>
    implements _$$IosDeviceCopyWith<$Res> {
  __$$IosDeviceCopyWithImpl(
      _$IosDevice _value, $Res Function(_$IosDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osName = null,
    Object? osVersionString = null,
  }) {
    return _then(_$IosDevice(
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

class _$IosDevice extends IosDevice with DiagnosticableTreeMixin {
  const _$IosDevice(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IosDevice &&
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
  _$$IosDeviceCopyWith<_$IosDevice> get copyWith =>
      __$$IosDeviceCopyWithImpl<_$IosDevice>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
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
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        macos,
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
      required final String osVersionString}) = _$IosDevice;
  const IosDevice._() : super._();

  @override
  String get name;
  @override
  String get model;
  @override
  String get osName;
  @override
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$IosDeviceCopyWith<_$IosDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MacosDeviceCopyWith<$Res>
    implements $UserDeviceCopyWith<$Res> {
  factory _$$MacosDeviceCopyWith(
          _$MacosDevice value, $Res Function(_$MacosDevice) then) =
      __$$MacosDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String model, String osName, String osVersionString});
}

/// @nodoc
class __$$MacosDeviceCopyWithImpl<$Res>
    extends _$UserDeviceCopyWithImpl<$Res, _$MacosDevice>
    implements _$$MacosDeviceCopyWith<$Res> {
  __$$MacosDeviceCopyWithImpl(
      _$MacosDevice _value, $Res Function(_$MacosDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? model = null,
    Object? osName = null,
    Object? osVersionString = null,
  }) {
    return _then(_$MacosDevice(
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

class _$MacosDevice extends MacosDevice with DiagnosticableTreeMixin {
  const _$MacosDevice(
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
    return 'UserDevice.macos(name: $name, model: $model, osName: $osName, osVersionString: $osVersionString)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserDevice.macos'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('osName', osName))
      ..add(DiagnosticsProperty('osVersionString', osVersionString));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacosDevice &&
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
  _$$MacosDeviceCopyWith<_$MacosDevice> get copyWith =>
      __$$MacosDeviceCopyWithImpl<_$MacosDevice>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        android,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        ios,
    required TResult Function(
            String name, String model, String osName, String osVersionString)
        macos,
  }) {
    return macos(name, model, osName, osVersionString);
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
    TResult? Function(
            String name, String model, String osName, String osVersionString)?
        macos,
  }) {
    return macos?.call(name, model, osName, osVersionString);
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
    TResult Function(
            String name, String model, String osName, String osVersionString)?
        macos,
    required TResult orElse(),
  }) {
    if (macos != null) {
      return macos(name, model, osName, osVersionString);
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
      required final String osName,
      required final String osVersionString}) = _$MacosDevice;
  const MacosDevice._() : super._();

  @override
  String get name;
  @override
  String get model;
  @override
  String get osName;
  @override
  String get osVersionString;
  @override
  @JsonKey(ignore: true)
  _$$MacosDeviceCopyWith<_$MacosDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
