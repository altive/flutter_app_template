// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'stock_list_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeStockFilterStateTearOff {
  const _$HomeStockFilterStateTearOff();

  _HomeStockFilterState call(
      {FilteringState inventory = FilteringState.notSelected,
      FilteringState expiration = FilteringState.notSelected,
      FilteringState category = FilteringState.notSelected}) {
    return _HomeStockFilterState(
      inventory: inventory,
      expiration: expiration,
      category: category,
    );
  }
}

/// @nodoc
const $HomeStockFilterState = _$HomeStockFilterStateTearOff();

/// @nodoc
mixin _$HomeStockFilterState {
  /// 在庫
  FilteringState get inventory => throw _privateConstructorUsedError;

  /// 期限
  FilteringState get expiration => throw _privateConstructorUsedError;

  /// 種類
  FilteringState get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStockFilterStateCopyWith<HomeStockFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStockFilterStateCopyWith<$Res> {
  factory $HomeStockFilterStateCopyWith(HomeStockFilterState value,
          $Res Function(HomeStockFilterState) then) =
      _$HomeStockFilterStateCopyWithImpl<$Res>;
  $Res call(
      {FilteringState inventory,
      FilteringState expiration,
      FilteringState category});
}

/// @nodoc
class _$HomeStockFilterStateCopyWithImpl<$Res>
    implements $HomeStockFilterStateCopyWith<$Res> {
  _$HomeStockFilterStateCopyWithImpl(this._value, this._then);

  final HomeStockFilterState _value;
  // ignore: unused_field
  final $Res Function(HomeStockFilterState) _then;

  @override
  $Res call({
    Object? inventory = freezed,
    Object? expiration = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      inventory: inventory == freezed
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as FilteringState,
      expiration: expiration == freezed
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as FilteringState,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FilteringState,
    ));
  }
}

/// @nodoc
abstract class _$HomeStockFilterStateCopyWith<$Res>
    implements $HomeStockFilterStateCopyWith<$Res> {
  factory _$HomeStockFilterStateCopyWith(_HomeStockFilterState value,
          $Res Function(_HomeStockFilterState) then) =
      __$HomeStockFilterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FilteringState inventory,
      FilteringState expiration,
      FilteringState category});
}

/// @nodoc
class __$HomeStockFilterStateCopyWithImpl<$Res>
    extends _$HomeStockFilterStateCopyWithImpl<$Res>
    implements _$HomeStockFilterStateCopyWith<$Res> {
  __$HomeStockFilterStateCopyWithImpl(
      _HomeStockFilterState _value, $Res Function(_HomeStockFilterState) _then)
      : super(_value, (v) => _then(v as _HomeStockFilterState));

  @override
  _HomeStockFilterState get _value => super._value as _HomeStockFilterState;

  @override
  $Res call({
    Object? inventory = freezed,
    Object? expiration = freezed,
    Object? category = freezed,
  }) {
    return _then(_HomeStockFilterState(
      inventory: inventory == freezed
          ? _value.inventory
          : inventory // ignore: cast_nullable_to_non_nullable
              as FilteringState,
      expiration: expiration == freezed
          ? _value.expiration
          : expiration // ignore: cast_nullable_to_non_nullable
              as FilteringState,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FilteringState,
    ));
  }
}

/// @nodoc

class _$_HomeStockFilterState extends _HomeStockFilterState
    with DiagnosticableTreeMixin {
  const _$_HomeStockFilterState(
      {this.inventory = FilteringState.notSelected,
      this.expiration = FilteringState.notSelected,
      this.category = FilteringState.notSelected})
      : super._();

  @JsonKey(defaultValue: FilteringState.notSelected)
  @override

  /// 在庫
  final FilteringState inventory;
  @JsonKey(defaultValue: FilteringState.notSelected)
  @override

  /// 期限
  final FilteringState expiration;
  @JsonKey(defaultValue: FilteringState.notSelected)
  @override

  /// 種類
  final FilteringState category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeStockFilterState(inventory: $inventory, expiration: $expiration, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeStockFilterState'))
      ..add(DiagnosticsProperty('inventory', inventory))
      ..add(DiagnosticsProperty('expiration', expiration))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeStockFilterState &&
            (identical(other.inventory, inventory) ||
                const DeepCollectionEquality()
                    .equals(other.inventory, inventory)) &&
            (identical(other.expiration, expiration) ||
                const DeepCollectionEquality()
                    .equals(other.expiration, expiration)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(inventory) ^
      const DeepCollectionEquality().hash(expiration) ^
      const DeepCollectionEquality().hash(category);

  @JsonKey(ignore: true)
  @override
  _$HomeStockFilterStateCopyWith<_HomeStockFilterState> get copyWith =>
      __$HomeStockFilterStateCopyWithImpl<_HomeStockFilterState>(
          this, _$identity);
}

abstract class _HomeStockFilterState extends HomeStockFilterState {
  const factory _HomeStockFilterState(
      {FilteringState inventory,
      FilteringState expiration,
      FilteringState category}) = _$_HomeStockFilterState;
  const _HomeStockFilterState._() : super._();

  @override

  /// 在庫
  FilteringState get inventory => throw _privateConstructorUsedError;
  @override

  /// 期限
  FilteringState get expiration => throw _privateConstructorUsedError;
  @override

  /// 種類
  FilteringState get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HomeStockFilterStateCopyWith<_HomeStockFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}
