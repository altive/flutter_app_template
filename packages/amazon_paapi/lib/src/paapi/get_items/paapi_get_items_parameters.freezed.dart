// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paapi_get_items_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_PaapiGetItemsParametersCopyWith<$Res>
    implements $PaapiGetItemsParametersCopyWith<$Res> {
  factory _$$_PaapiGetItemsParametersCopyWith(_$_PaapiGetItemsParameters value,
          $Res Function(_$_PaapiGetItemsParameters) then) =
      __$$_PaapiGetItemsParametersCopyWithImpl<$Res>;
  @override
  $Res call({List<String> asin, List<String> resources});
}

/// @nodoc
class __$$_PaapiGetItemsParametersCopyWithImpl<$Res>
    extends _$PaapiGetItemsParametersCopyWithImpl<$Res>
    implements _$$_PaapiGetItemsParametersCopyWith<$Res> {
  __$$_PaapiGetItemsParametersCopyWithImpl(_$_PaapiGetItemsParameters _value,
      $Res Function(_$_PaapiGetItemsParameters) _then)
      : super(_value, (v) => _then(v as _$_PaapiGetItemsParameters));

  @override
  _$_PaapiGetItemsParameters get _value =>
      super._value as _$_PaapiGetItemsParameters;

  @override
  $Res call({
    Object? asin = freezed,
    Object? resources = freezed,
  }) {
    return _then(_$_PaapiGetItemsParameters(
      asin: asin == freezed
          ? _value._asin
          : asin // ignore: cast_nullable_to_non_nullable
              as List<String>,
      resources: resources == freezed
          ? _value._resources
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
      {final List<String> asin = const <String>[],
      final List<String> resources = const <String>[]})
      : _asin = asin,
        _resources = resources;

// Amazon Standard Identification Number: 10文字のユニークな英数字
  final List<String> _asin;
// Amazon Standard Identification Number: 10文字のユニークな英数字
  @override
  @JsonKey()
  List<String> get asin {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asin);
  }

// 欲しいレスポンス情報
  final List<String> _resources;
// 欲しいレスポンス情報
  @override
  @JsonKey()
  List<String> get resources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_PaapiGetItemsParameters &&
            const DeepCollectionEquality().equals(other._asin, _asin) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_asin),
      const DeepCollectionEquality().hash(_resources));

  @JsonKey(ignore: true)
  @override
  _$$_PaapiGetItemsParametersCopyWith<_$_PaapiGetItemsParameters>
      get copyWith =>
          __$$_PaapiGetItemsParametersCopyWithImpl<_$_PaapiGetItemsParameters>(
              this, _$identity);
}

abstract class _PaapiGetItemsParameters implements PaapiGetItemsParameters {
  const factory _PaapiGetItemsParameters(
      {final List<String> asin,
      final List<String> resources}) = _$_PaapiGetItemsParameters;

  @override // Amazon Standard Identification Number: 10文字のユニークな英数字
  List<String> get asin => throw _privateConstructorUsedError;
  @override // 欲しいレスポンス情報
  List<String> get resources => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PaapiGetItemsParametersCopyWith<_$_PaapiGetItemsParameters>
      get copyWith => throw _privateConstructorUsedError;
}
