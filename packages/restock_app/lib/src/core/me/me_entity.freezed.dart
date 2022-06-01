// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'me_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MeEntity _$MeEntityFromJson(Map<String, dynamic> json) {
  return _MeEntity.fromJson(json);
}

/// @nodoc
mixin _$MeEntity {
  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 更新日時
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// ニックネーム
  String? get nickname => throw _privateConstructorUsedError;

  /// ユーザーが作成したグループリスト
  @JsonKey(name: MeEntityField.groups)
  List<String>? get groups => throw _privateConstructorUsedError;

  /// マイストックを非公開にするか
  bool? get isPrivateMyStock => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeEntityCopyWith<MeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeEntityCopyWith<$Res> {
  factory $MeEntityCopyWith(MeEntity value, $Res Function(MeEntity) then) =
      _$MeEntityCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: MeEntityField.groups) List<String>? groups,
      bool? isPrivateMyStock});
}

/// @nodoc
class _$MeEntityCopyWithImpl<$Res> implements $MeEntityCopyWith<$Res> {
  _$MeEntityCopyWithImpl(this._value, this._then);

  final MeEntity _value;
  // ignore: unused_field
  final $Res Function(MeEntity) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nickname = freezed,
    Object? groups = freezed,
    Object? isPrivateMyStock = freezed,
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
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPrivateMyStock: isPrivateMyStock == freezed
          ? _value.isPrivateMyStock
          : isPrivateMyStock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_MeEntityCopyWith<$Res> implements $MeEntityCopyWith<$Res> {
  factory _$$_MeEntityCopyWith(
          _$_MeEntity value, $Res Function(_$_MeEntity) then) =
      __$$_MeEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      String? nickname,
      @JsonKey(name: MeEntityField.groups) List<String>? groups,
      bool? isPrivateMyStock});
}

/// @nodoc
class __$$_MeEntityCopyWithImpl<$Res> extends _$MeEntityCopyWithImpl<$Res>
    implements _$$_MeEntityCopyWith<$Res> {
  __$$_MeEntityCopyWithImpl(
      _$_MeEntity _value, $Res Function(_$_MeEntity) _then)
      : super(_value, (v) => _then(v as _$_MeEntity));

  @override
  _$_MeEntity get _value => super._value as _$_MeEntity;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? nickname = freezed,
    Object? groups = freezed,
    Object? isPrivateMyStock = freezed,
  }) {
    return _then(_$_MeEntity(
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
      groups: groups == freezed
          ? _value._groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isPrivateMyStock: isPrivateMyStock == freezed
          ? _value.isPrivateMyStock
          : isPrivateMyStock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MeEntity extends _MeEntity with DiagnosticableTreeMixin {
  const _$_MeEntity(
      {@TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.nickname,
      @JsonKey(name: MeEntityField.groups) final List<String>? groups,
      this.isPrivateMyStock})
      : _groups = groups,
        super._();

  factory _$_MeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MeEntityFromJson(json);

  /// 作成日時
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  /// 更新日時
  @override
  @TimestampConverter()
  final DateTime? updatedAt;

  /// ニックネーム
  @override
  final String? nickname;

  /// ユーザーが作成したグループリスト
  final List<String>? _groups;

  /// ユーザーが作成したグループリスト
  @override
  @JsonKey(name: MeEntityField.groups)
  List<String>? get groups {
    final value = _groups;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// マイストックを非公開にするか
  @override
  final bool? isPrivateMyStock;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MeEntity(createdAt: $createdAt, updatedAt: $updatedAt, nickname: $nickname, groups: $groups, isPrivateMyStock: $isPrivateMyStock)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MeEntity'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('nickname', nickname))
      ..add(DiagnosticsProperty('groups', groups))
      ..add(DiagnosticsProperty('isPrivateMyStock', isPrivateMyStock));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MeEntity &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.nickname, nickname) &&
            const DeepCollectionEquality().equals(other._groups, _groups) &&
            const DeepCollectionEquality()
                .equals(other.isPrivateMyStock, isPrivateMyStock));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(nickname),
      const DeepCollectionEquality().hash(_groups),
      const DeepCollectionEquality().hash(isPrivateMyStock));

  @JsonKey(ignore: true)
  @override
  _$$_MeEntityCopyWith<_$_MeEntity> get copyWith =>
      __$$_MeEntityCopyWithImpl<_$_MeEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MeEntityToJson(this);
  }
}

abstract class _MeEntity extends MeEntity {
  const factory _MeEntity(
      {@TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      final String? nickname,
      @JsonKey(name: MeEntityField.groups) final List<String>? groups,
      final bool? isPrivateMyStock}) = _$_MeEntity;
  const _MeEntity._() : super._();

  factory _MeEntity.fromJson(Map<String, dynamic> json) = _$_MeEntity.fromJson;

  @override

  /// 作成日時
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override

  /// 更新日時
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override

  /// ニックネーム
  String? get nickname => throw _privateConstructorUsedError;
  @override

  /// ユーザーが作成したグループリスト
  @JsonKey(name: MeEntityField.groups)
  List<String>? get groups => throw _privateConstructorUsedError;
  @override

  /// マイストックを非公開にするか
  bool? get isPrivateMyStock => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MeEntityCopyWith<_$_MeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
