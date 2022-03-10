// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'paapi_get_items_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaapiGetItemsParametersTearOff {
  const _$PaapiGetItemsParametersTearOff();

  _PaapiGetItemsParameters call(
      {List<String> asin = const <String>[],
      List<String> resources = const <String>[]}) {
    return _PaapiGetItemsParameters(
      asin: asin,
      resources: resources,
    );
  }
}

/// @nodoc
const $PaapiGetItemsParameters = _$PaapiGetItemsParametersTearOff();

/// @nodoc
mixin _$PaapiGetItemsParameters {
// Amazon Standard Identification Number: 10文字のユニークな英数字
  List<String> get asin => throw _privateConstructorUsedError; // 欲しいレスポンス情報
  List<String> get resources => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaapiGetItemsParametersCopyWith<PaapiGetItemsParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaapiGetItemsParametersCopyWith<$Res> {
  factory $PaapiGetItemsParametersCopyWith(PaapiGetItemsParameters value,
          $Res Function(PaapiGetItemsParameters) then) =
      _$PaapiGetItemsParametersCopyWithImpl<$Res>;
  $Res call({List<String> asin, List<String> resources});
}

/// @nodoc
class _$PaapiGetItemsParametersCopyWithImpl<$Res>
    implements $PaapiGetItemsParametersCopyWith<$Res> {
  _$PaapiGetItemsParametersCopyWithImpl(this._value, this._then);

  final PaapiGetItemsParameters _value;
  // ignore: unused_field
  final $Res Function(PaapiGetItemsParameters) _then;

  @override
  $Res call({
    Object? asin = freezed,
    Object? resources = freezed,
  }) {
    return _then(_value.copyWith(
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$PaapiGetItemsParametersCopyWith<$Res>
    implements $PaapiGetItemsParametersCopyWith<$Res> {
  factory _$PaapiGetItemsParametersCopyWith(_PaapiGetItemsParameters value,
          $Res Function(_PaapiGetItemsParameters) then) =
      __$PaapiGetItemsParametersCopyWithImpl<$Res>;
  @override
  $Res call({List<String> asin, List<String> resources});
}

/// @nodoc
class __$PaapiGetItemsParametersCopyWithImpl<$Res>
    extends _$PaapiGetItemsParametersCopyWithImpl<$Res>
    implements _$PaapiGetItemsParametersCopyWith<$Res> {
  __$PaapiGetItemsParametersCopyWithImpl(_PaapiGetItemsParameters _value,
      $Res Function(_PaapiGetItemsParameters) _then)
      : super(_value, (v) => _then(v as _PaapiGetItemsParameters));

  @override
  _PaapiGetItemsParameters get _value =>
      super._value as _PaapiGetItemsParameters;

  @override
  $Res call({
    Object? asin = freezed,
    Object? resources = freezed,
  }) {
    return _then(_PaapiGetItemsParameters(
      asin: asin == freezed
          ? _value.asin
          : asin // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PaapiGetItemsParameters
    with DiagnosticableTreeMixin
    implements _PaapiGetItemsParameters {
  const _$_PaapiGetItemsParameters(
      {this.asin = const <String>[], this.resources = const <String>[]});

  @JsonKey(defaultValue: const <String>[])
  @override // Amazon Standard Identification Number: 10文字のユニークな英数字
  final List<String> asin;
  @JsonKey(defaultValue: const <String>[])
  @override // 欲しいレスポンス情報
  final List<String> resources;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaapiGetItemsParameters(asin: $asin, resources: $resources)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaapiGetItemsParameters'))
      ..add(DiagnosticsProperty('asin', asin))
      ..add(DiagnosticsProperty('resources', resources));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaapiGetItemsParameters &&
            (identical(other.asin, asin) ||
                const DeepCollectionEquality().equals(other.asin, asin)) &&
            (identical(other.resources, resources) ||
                const DeepCollectionEquality()
                    .equals(other.resources, resources)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(asin) ^
      const DeepCollectionEquality().hash(resources);

  @JsonKey(ignore: true)
  @override
  _$PaapiGetItemsParametersCopyWith<_PaapiGetItemsParameters> get copyWith =>
      __$PaapiGetItemsParametersCopyWithImpl<_PaapiGetItemsParameters>(
          this, _$identity);
}

abstract class _PaapiGetItemsParameters implements PaapiGetItemsParameters {
  const factory _PaapiGetItemsParameters(
      {List<String> asin, List<String> resources}) = _$_PaapiGetItemsParameters;

  @override // Amazon Standard Identification Number: 10文字のユニークな英数字
  List<String> get asin => throw _privateConstructorUsedError;
  @override // 欲しいレスポンス情報
  List<String> get resources => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaapiGetItemsParametersCopyWith<_PaapiGetItemsParameters> get copyWith =>
      throw _privateConstructorUsedError;
}
