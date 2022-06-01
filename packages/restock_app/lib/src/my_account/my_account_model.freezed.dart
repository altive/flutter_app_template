// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) {
  return _AppUserModel.fromJson(json);
}

/// @nodoc
mixin _$AppUserModel {
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError; // ニックネーム
  String? get nickname => throw _privateConstructorUsedError; // ストック保管場所
  @JsonKey(name: 'stockPlaces')
  List<String>? get stockCategories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserModelCopyWith<AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserModelCopyWith<$Res> {
  factory $AppUserModelCopyWith(
          AppUserModel value, $Res Function(AppUserModel) then) =
      _$AppUserModelCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: 'stockPlaces') List<String>? stockCategories});
}

/// @nodoc
class _$AppUserModelCopyWithImpl<$Res> implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._value, this._then);

  final AppUserModel _value;
  // ignore: unused_field
  final $Res Function(AppUserModel) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nickname = freezed,
    Object? stockCategories = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      stockCategories: stockCategories == freezed
          ? _value.stockCategories
          : stockCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppUserModelCopyWith<$Res>
    implements $AppUserModelCopyWith<$Res> {
  factory _$$_AppUserModelCopyWith(
          _$_AppUserModel value, $Res Function(_$_AppUserModel) then) =
      __$$_AppUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: 'stockPlaces') List<String>? stockCategories});
}

/// @nodoc
class __$$_AppUserModelCopyWithImpl<$Res>
    extends _$AppUserModelCopyWithImpl<$Res>
    implements _$$_AppUserModelCopyWith<$Res> {
  __$$_AppUserModelCopyWithImpl(
      _$_AppUserModel _value, $Res Function(_$_AppUserModel) _then)
      : super(_value, (v) => _then(v as _$_AppUserModel));

  @override
  _$_AppUserModel get _value => super._value as _$_AppUserModel;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nickname = freezed,
    Object? stockCategories = freezed,
  }) {
    return _then(_$_AppUserModel(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      stockCategories: stockCategories == freezed
          ? _value._stockCategories
          : stockCategories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppUserModel extends _AppUserModel with DiagnosticableTreeMixin {
  const _$_AppUserModel(
      {@TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.nickname,
      @JsonKey(name: 'stockPlaces') final List<String>? stockCategories})
      : _stockCategories = stockCategories,
        super._();

  factory _$_AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_AppUserModelFromJson(json);

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
// ニックネーム
  @override
  final String? nickname;
// ストック保管場所
  final List<String>? _stockCategories;
// ストック保管場所
  @override
  @JsonKey(name: 'stockPlaces')
  List<String>? get stockCategories {
    final value = _stockCategories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUserModel(createdAt: $createdAt, updatedAt: $updatedAt, nickname: $nickname, stockCategories: $stockCategories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUserModel'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('stockCategories', stockCategories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppUserModel &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality()
                .equals(other._stockCategories, _stockCategories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(_stockCategories));

  @JsonKey(ignore: true)
  @override
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      __$$_AppUserModelCopyWithImpl<_$_AppUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppUserModelToJson(this);
  }
}

abstract class _AppUserModel extends AppUserModel {
  const factory _AppUserModel(
          {@TimestampConverter() final DateTime? createdAt,
          @TimestampConverter() final DateTime? updatedAt,
          final String? nickname,
          @JsonKey(name: 'stockPlaces') final List<String>? stockCategories}) =
      _$_AppUserModel;
  const _AppUserModel._() : super._();

  factory _AppUserModel.fromJson(Map<String, dynamic> json) =
      _$_AppUserModel.fromJson;

  @override
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override // ニックネーム
  String? get nickname => throw _privateConstructorUsedError;
  @override // ストック保管場所
  @JsonKey(name: 'stockPlaces')
  List<String>? get stockCategories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppUserModelCopyWith<_$_AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
