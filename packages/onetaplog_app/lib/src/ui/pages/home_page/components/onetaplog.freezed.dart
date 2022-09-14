// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onetaplog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTLog _$OTLogFromJson(Map<String, dynamic> json) {
  return _OTLog.fromJson(json);
}

/// @nodoc
mixin _$OTLog {
  String get title => throw _privateConstructorUsedError;
  @iconDataConverter
  IconData get iconData => throw _privateConstructorUsedError;
  @colorConverter
  Color get color => throw _privateConstructorUsedError;
  DateTime get lastUpdatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTLogCopyWith<OTLog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTLogCopyWith<$Res> {
  factory $OTLogCopyWith(OTLog value, $Res Function(OTLog) then) =
      _$OTLogCopyWithImpl<$Res>;
  $Res call(
      {String title,
      @iconDataConverter IconData iconData,
      @colorConverter Color color,
      DateTime lastUpdatedAt});
}

/// @nodoc
class _$OTLogCopyWithImpl<$Res> implements $OTLogCopyWith<$Res> {
  _$OTLogCopyWithImpl(this._value, this._then);

  final OTLog _value;
  // ignore: unused_field
  final $Res Function(OTLog) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? iconData = freezed,
    Object? color = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_OTLogCopyWith<$Res> implements $OTLogCopyWith<$Res> {
  factory _$$_OTLogCopyWith(_$_OTLog value, $Res Function(_$_OTLog) then) =
      __$$_OTLogCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      @iconDataConverter IconData iconData,
      @colorConverter Color color,
      DateTime lastUpdatedAt});
}

/// @nodoc
class __$$_OTLogCopyWithImpl<$Res> extends _$OTLogCopyWithImpl<$Res>
    implements _$$_OTLogCopyWith<$Res> {
  __$$_OTLogCopyWithImpl(_$_OTLog _value, $Res Function(_$_OTLog) _then)
      : super(_value, (v) => _then(v as _$_OTLog));

  @override
  _$_OTLog get _value => super._value as _$_OTLog;

  @override
  $Res call({
    Object? title = freezed,
    Object? iconData = freezed,
    Object? color = freezed,
    Object? lastUpdatedAt = freezed,
  }) {
    return _then(_$_OTLog(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      iconData: iconData == freezed
          ? _value.iconData
          : iconData // ignore: cast_nullable_to_non_nullable
              as IconData,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      lastUpdatedAt: lastUpdatedAt == freezed
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTLog extends _OTLog {
  const _$_OTLog(
      {required this.title,
      @iconDataConverter required this.iconData,
      @colorConverter required this.color,
      required this.lastUpdatedAt})
      : super._();

  factory _$_OTLog.fromJson(Map<String, dynamic> json) =>
      _$$_OTLogFromJson(json);

  @override
  final String title;
  @override
  @iconDataConverter
  final IconData iconData;
  @override
  @colorConverter
  final Color color;
  @override
  final DateTime lastUpdatedAt;

  @override
  String toString() {
    return 'OTLog(title: $title, iconData: $iconData, color: $color, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OTLog &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.iconData, iconData) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedAt, lastUpdatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(iconData),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(lastUpdatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_OTLogCopyWith<_$_OTLog> get copyWith =>
      __$$_OTLogCopyWithImpl<_$_OTLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTLogToJson(
      this,
    );
  }
}

abstract class _OTLog extends OTLog {
  const factory _OTLog(
      {required final String title,
      @iconDataConverter required final IconData iconData,
      @colorConverter required final Color color,
      required final DateTime lastUpdatedAt}) = _$_OTLog;
  const _OTLog._() : super._();

  factory _OTLog.fromJson(Map<String, dynamic> json) = _$_OTLog.fromJson;

  @override
  String get title;
  @override
  @iconDataConverter
  IconData get iconData;
  @override
  @colorConverter
  Color get color;
  @override
  DateTime get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_OTLogCopyWith<_$_OTLog> get copyWith =>
      throw _privateConstructorUsedError;
}
