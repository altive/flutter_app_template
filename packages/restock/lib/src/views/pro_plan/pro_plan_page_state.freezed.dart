// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pro_plan_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProPlanPageStateTearOff {
  const _$ProPlanPageStateTearOff();

  _ProPlanPageState call(
      {bool isLoading = false,
      ProPlanInformation? monthlyProPlanInformation,
      ProPlanInformation? annualProPlanInformation}) {
    return _ProPlanPageState(
      isLoading: isLoading,
      monthlyProPlanInformation: monthlyProPlanInformation,
      annualProPlanInformation: annualProPlanInformation,
    );
  }
}

/// @nodoc
const $ProPlanPageState = _$ProPlanPageStateTearOff();

/// @nodoc
mixin _$ProPlanPageState {
  /// ローディング
  bool get isLoading => throw _privateConstructorUsedError;

  /// 月契約のProプラン情報@nullable
  ProPlanInformation? get monthlyProPlanInformation =>
      throw _privateConstructorUsedError;

  /// 年契約のProプラン情報@nullable
  ProPlanInformation? get annualProPlanInformation =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProPlanPageStateCopyWith<ProPlanPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProPlanPageStateCopyWith<$Res> {
  factory $ProPlanPageStateCopyWith(
          ProPlanPageState value, $Res Function(ProPlanPageState) then) =
      _$ProPlanPageStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      ProPlanInformation? monthlyProPlanInformation,
      ProPlanInformation? annualProPlanInformation});
}

/// @nodoc
class _$ProPlanPageStateCopyWithImpl<$Res>
    implements $ProPlanPageStateCopyWith<$Res> {
  _$ProPlanPageStateCopyWithImpl(this._value, this._then);

  final ProPlanPageState _value;
  // ignore: unused_field
  final $Res Function(ProPlanPageState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? monthlyProPlanInformation = freezed,
    Object? annualProPlanInformation = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyProPlanInformation: monthlyProPlanInformation == freezed
          ? _value.monthlyProPlanInformation
          : monthlyProPlanInformation // ignore: cast_nullable_to_non_nullable
              as ProPlanInformation?,
      annualProPlanInformation: annualProPlanInformation == freezed
          ? _value.annualProPlanInformation
          : annualProPlanInformation // ignore: cast_nullable_to_non_nullable
              as ProPlanInformation?,
    ));
  }
}

/// @nodoc
abstract class _$ProPlanPageStateCopyWith<$Res>
    implements $ProPlanPageStateCopyWith<$Res> {
  factory _$ProPlanPageStateCopyWith(
          _ProPlanPageState value, $Res Function(_ProPlanPageState) then) =
      __$ProPlanPageStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      ProPlanInformation? monthlyProPlanInformation,
      ProPlanInformation? annualProPlanInformation});
}

/// @nodoc
class __$ProPlanPageStateCopyWithImpl<$Res>
    extends _$ProPlanPageStateCopyWithImpl<$Res>
    implements _$ProPlanPageStateCopyWith<$Res> {
  __$ProPlanPageStateCopyWithImpl(
      _ProPlanPageState _value, $Res Function(_ProPlanPageState) _then)
      : super(_value, (v) => _then(v as _ProPlanPageState));

  @override
  _ProPlanPageState get _value => super._value as _ProPlanPageState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? monthlyProPlanInformation = freezed,
    Object? annualProPlanInformation = freezed,
  }) {
    return _then(_ProPlanPageState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      monthlyProPlanInformation: monthlyProPlanInformation == freezed
          ? _value.monthlyProPlanInformation
          : monthlyProPlanInformation // ignore: cast_nullable_to_non_nullable
              as ProPlanInformation?,
      annualProPlanInformation: annualProPlanInformation == freezed
          ? _value.annualProPlanInformation
          : annualProPlanInformation // ignore: cast_nullable_to_non_nullable
              as ProPlanInformation?,
    ));
  }
}

/// @nodoc

class _$_ProPlanPageState
    with DiagnosticableTreeMixin
    implements _ProPlanPageState {
  const _$_ProPlanPageState(
      {this.isLoading = false,
      this.monthlyProPlanInformation,
      this.annualProPlanInformation});

  @JsonKey(defaultValue: false)
  @override

  /// ローディング
  final bool isLoading;
  @override

  /// 月契約のProプラン情報@nullable
  final ProPlanInformation? monthlyProPlanInformation;
  @override

  /// 年契約のProプラン情報@nullable
  final ProPlanInformation? annualProPlanInformation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProPlanPageState(isLoading: $isLoading, monthlyProPlanInformation: $monthlyProPlanInformation, annualProPlanInformation: $annualProPlanInformation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProPlanPageState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty(
          'monthlyProPlanInformation', monthlyProPlanInformation))
      ..add(DiagnosticsProperty(
          'annualProPlanInformation', annualProPlanInformation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProPlanPageState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.monthlyProPlanInformation,
                    monthlyProPlanInformation) ||
                const DeepCollectionEquality().equals(
                    other.monthlyProPlanInformation,
                    monthlyProPlanInformation)) &&
            (identical(
                    other.annualProPlanInformation, annualProPlanInformation) ||
                const DeepCollectionEquality().equals(
                    other.annualProPlanInformation, annualProPlanInformation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(monthlyProPlanInformation) ^
      const DeepCollectionEquality().hash(annualProPlanInformation);

  @JsonKey(ignore: true)
  @override
  _$ProPlanPageStateCopyWith<_ProPlanPageState> get copyWith =>
      __$ProPlanPageStateCopyWithImpl<_ProPlanPageState>(this, _$identity);
}

abstract class _ProPlanPageState implements ProPlanPageState {
  const factory _ProPlanPageState(
      {bool isLoading,
      ProPlanInformation? monthlyProPlanInformation,
      ProPlanInformation? annualProPlanInformation}) = _$_ProPlanPageState;

  @override

  /// ローディング
  bool get isLoading => throw _privateConstructorUsedError;
  @override

  /// 月契約のProプラン情報@nullable
  ProPlanInformation? get monthlyProPlanInformation =>
      throw _privateConstructorUsedError;
  @override

  /// 年契約のProプラン情報@nullable
  ProPlanInformation? get annualProPlanInformation =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProPlanPageStateCopyWith<_ProPlanPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
