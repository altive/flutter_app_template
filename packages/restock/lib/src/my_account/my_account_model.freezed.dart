// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'my_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) {
  return _AppUserModel.fromJson(json);
}

/// @nodoc
class _$AppUserModelTearOff {
  const _$AppUserModelTearOff();

  _AppUserModel call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: 'stockPlaces') List<String>? stockCategories}) {
    return _AppUserModel(
      createdAt: createdAt,
      updatedAt: updatedAt,
      nickname: nickname,
      stockCategories: stockCategories,
    );
  }

  AppUserModel fromJson(Map<String, Object> json) {
    return AppUserModel.fromJson(json);
  }
}

/// @nodoc
const $AppUserModel = _$AppUserModelTearOff();

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
abstract class _$AppUserModelCopyWith<$Res>
    implements $AppUserModelCopyWith<$Res> {
  factory _$AppUserModelCopyWith(
          _AppUserModel value, $Res Function(_AppUserModel) then) =
      __$AppUserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: 'stockPlaces') List<String>? stockCategories});
}

/// @nodoc
class __$AppUserModelCopyWithImpl<$Res> extends _$AppUserModelCopyWithImpl<$Res>
    implements _$AppUserModelCopyWith<$Res> {
  __$AppUserModelCopyWithImpl(
      _AppUserModel _value, $Res Function(_AppUserModel) _then)
      : super(_value, (v) => _then(v as _AppUserModel));

  @override
  _AppUserModel get _value => super._value as _AppUserModel;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nickname = freezed,
    Object? stockCategories = freezed,
  }) {
    return _then(_AppUserModel(
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
@JsonSerializable()
class _$_AppUserModel extends _AppUserModel with DiagnosticableTreeMixin {
  const _$_AppUserModel(
      {@TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.nickname,
      @JsonKey(name: 'stockPlaces') this.stockCategories})
      : super._();

  factory _$_AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AppUserModelFromJson(json);

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override // ニックネーム
  final String? nickname;
  @override // ストック保管場所
  @JsonKey(name: 'stockPlaces')
  final List<String>? stockCategories;

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
        (other is _AppUserModel &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)) &&
            (identical(other.stockCategories, stockCategories) ||
                const DeepCollectionEquality()
                    .equals(other.stockCategories, stockCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(nickname) ^
      const DeepCollectionEquality().hash(stockCategories);

  @JsonKey(ignore: true)
  @override
  _$AppUserModelCopyWith<_AppUserModel> get copyWith =>
      __$AppUserModelCopyWithImpl<_AppUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppUserModelToJson(this);
  }
}

abstract class _AppUserModel extends AppUserModel {
  const factory _AppUserModel(
          {@TimestampConverter() DateTime? createdAt,
          @TimestampConverter() DateTime? updatedAt,
          String? nickname,
          @JsonKey(name: 'stockPlaces') List<String>? stockCategories}) =
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
  _$AppUserModelCopyWith<_AppUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
