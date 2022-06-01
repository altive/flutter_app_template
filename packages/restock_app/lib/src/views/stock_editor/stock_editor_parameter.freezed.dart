// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'stock_editor_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StockEditorParameter {
  /// @nullable
  StockEditorMode? get mode => throw _privateConstructorUsedError;

  /// @nullable
  StockEntity? get stock => throw _privateConstructorUsedError;

  /// @nullable
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockEditorParameterCopyWith<StockEditorParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockEditorParameterCopyWith<$Res> {
  factory $StockEditorParameterCopyWith(StockEditorParameter value,
          $Res Function(StockEditorParameter) then) =
      _$StockEditorParameterCopyWithImpl<$Res>;
  $Res call({StockEditorMode? mode, StockEntity? stock, File? imageFile});

  $StockEntityCopyWith<$Res>? get stock;
}

/// @nodoc
class _$StockEditorParameterCopyWithImpl<$Res>
    implements $StockEditorParameterCopyWith<$Res> {
  _$StockEditorParameterCopyWithImpl(this._value, this._then);

  final StockEditorParameter _value;
  // ignore: unused_field
  final $Res Function(StockEditorParameter) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? stock = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as StockEditorMode?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as StockEntity?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }

  @override
  $StockEntityCopyWith<$Res>? get stock {
    if (_value.stock == null) {
      return null;
    }

    return $StockEntityCopyWith<$Res>(_value.stock!, (value) {
      return _then(_value.copyWith(stock: value));
    });
  }
}

/// @nodoc
abstract class _$$_StockEditorParameterCopyWith<$Res>
    implements $StockEditorParameterCopyWith<$Res> {
  factory _$$_StockEditorParameterCopyWith(_$_StockEditorParameter value,
          $Res Function(_$_StockEditorParameter) then) =
      __$$_StockEditorParameterCopyWithImpl<$Res>;
  @override
  $Res call({StockEditorMode? mode, StockEntity? stock, File? imageFile});

  @override
  $StockEntityCopyWith<$Res>? get stock;
}

/// @nodoc
class __$$_StockEditorParameterCopyWithImpl<$Res>
    extends _$StockEditorParameterCopyWithImpl<$Res>
    implements _$$_StockEditorParameterCopyWith<$Res> {
  __$$_StockEditorParameterCopyWithImpl(_$_StockEditorParameter _value,
      $Res Function(_$_StockEditorParameter) _then)
      : super(_value, (v) => _then(v as _$_StockEditorParameter));

  @override
  _$_StockEditorParameter get _value => super._value as _$_StockEditorParameter;

  @override
  $Res call({
    Object? mode = freezed,
    Object? stock = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$_StockEditorParameter(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as StockEditorMode?,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as StockEntity?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_StockEditorParameter
    with DiagnosticableTreeMixin
    implements _StockEditorParameter {
  const _$_StockEditorParameter({this.mode, this.stock, this.imageFile});

  /// @nullable
  @override
  final StockEditorMode? mode;

  /// @nullable
  @override
  final StockEntity? stock;

  /// @nullable
  @override
  final File? imageFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StockEditorParameter(mode: $mode, stock: $stock, imageFile: $imageFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StockEditorParameter'))
      ..add(DiagnosticsProperty('mode', mode))
      ..add(DiagnosticsProperty('stock', stock))
      ..add(DiagnosticsProperty('imageFile', imageFile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StockEditorParameter &&
            const DeepCollectionEquality().equals(other.mode, mode) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mode),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$$_StockEditorParameterCopyWith<_$_StockEditorParameter> get copyWith =>
      __$$_StockEditorParameterCopyWithImpl<_$_StockEditorParameter>(
          this, _$identity);
}

abstract class _StockEditorParameter implements StockEditorParameter {
  const factory _StockEditorParameter(
      {final StockEditorMode? mode,
      final StockEntity? stock,
      final File? imageFile}) = _$_StockEditorParameter;

  @override

  /// @nullable
  StockEditorMode? get mode => throw _privateConstructorUsedError;
  @override

  /// @nullable
  StockEntity? get stock => throw _privateConstructorUsedError;
  @override

  /// @nullable
  File? get imageFile => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StockEditorParameterCopyWith<_$_StockEditorParameter> get copyWith =>
      throw _privateConstructorUsedError;
}
