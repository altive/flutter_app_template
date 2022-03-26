// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'paapi_search_items_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaapiSearchItemsParametersTearOff {
  const _$PaapiSearchItemsParametersTearOff();

  _PaapiSearchItemsParameters call(
      {String? keyword,
      List<String> resources = const <String>[],
      String? searchIndex,
      int? itemCount,
      int? itemPage}) {
    return _PaapiSearchItemsParameters(
      keyword: keyword,
      resources: resources,
      searchIndex: searchIndex,
      itemCount: itemCount,
      itemPage: itemPage,
    );
  }
}

/// @nodoc
const $PaapiSearchItemsParameters = _$PaapiSearchItemsParametersTearOff();

/// @nodoc
mixin _$PaapiSearchItemsParameters {
// 検索キーワードまたはフレーズ
  String? get keyword => throw _privateConstructorUsedError; // 欲しいレスポンス情報
  List<String> get resources =>
      throw _privateConstructorUsedError; // 検索対象の製品カテゴリ
  String? get searchIndex =>
      throw _privateConstructorUsedError; // 幾つの検索結果を返却するか
  int? get itemCount =>
      throw _privateConstructorUsedError; // 検索結果のうちの何ページを目を返却するか
  int? get itemPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaapiSearchItemsParametersCopyWith<PaapiSearchItemsParameters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaapiSearchItemsParametersCopyWith<$Res> {
  factory $PaapiSearchItemsParametersCopyWith(PaapiSearchItemsParameters value,
          $Res Function(PaapiSearchItemsParameters) then) =
      _$PaapiSearchItemsParametersCopyWithImpl<$Res>;
  $Res call(
      {String? keyword,
      List<String> resources,
      String? searchIndex,
      int? itemCount,
      int? itemPage});
}

/// @nodoc
class _$PaapiSearchItemsParametersCopyWithImpl<$Res>
    implements $PaapiSearchItemsParametersCopyWith<$Res> {
  _$PaapiSearchItemsParametersCopyWithImpl(this._value, this._then);

  final PaapiSearchItemsParameters _value;
  // ignore: unused_field
  final $Res Function(PaapiSearchItemsParameters) _then;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? resources = freezed,
    Object? searchIndex = freezed,
    Object? itemCount = freezed,
    Object? itemPage = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchIndex: searchIndex == freezed
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPage: itemPage == freezed
          ? _value.itemPage
          : itemPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$PaapiSearchItemsParametersCopyWith<$Res>
    implements $PaapiSearchItemsParametersCopyWith<$Res> {
  factory _$PaapiSearchItemsParametersCopyWith(
          _PaapiSearchItemsParameters value,
          $Res Function(_PaapiSearchItemsParameters) then) =
      __$PaapiSearchItemsParametersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? keyword,
      List<String> resources,
      String? searchIndex,
      int? itemCount,
      int? itemPage});
}

/// @nodoc
class __$PaapiSearchItemsParametersCopyWithImpl<$Res>
    extends _$PaapiSearchItemsParametersCopyWithImpl<$Res>
    implements _$PaapiSearchItemsParametersCopyWith<$Res> {
  __$PaapiSearchItemsParametersCopyWithImpl(_PaapiSearchItemsParameters _value,
      $Res Function(_PaapiSearchItemsParameters) _then)
      : super(_value, (v) => _then(v as _PaapiSearchItemsParameters));

  @override
  _PaapiSearchItemsParameters get _value =>
      super._value as _PaapiSearchItemsParameters;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? resources = freezed,
    Object? searchIndex = freezed,
    Object? itemCount = freezed,
    Object? itemPage = freezed,
  }) {
    return _then(_PaapiSearchItemsParameters(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      resources: resources == freezed
          ? _value.resources
          : resources // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchIndex: searchIndex == freezed
          ? _value.searchIndex
          : searchIndex // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCount: itemCount == freezed
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int?,
      itemPage: itemPage == freezed
          ? _value.itemPage
          : itemPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_PaapiSearchItemsParameters
    with DiagnosticableTreeMixin
    implements _PaapiSearchItemsParameters {
  const _$_PaapiSearchItemsParameters(
      {this.keyword,
      this.resources = const <String>[],
      this.searchIndex,
      this.itemCount,
      this.itemPage});

  @override // 検索キーワードまたはフレーズ
  final String? keyword;
  @JsonKey(defaultValue: const <String>[])
  @override // 欲しいレスポンス情報
  final List<String> resources;
  @override // 検索対象の製品カテゴリ
  final String? searchIndex;
  @override // 幾つの検索結果を返却するか
  final int? itemCount;
  @override // 検索結果のうちの何ページを目を返却するか
  final int? itemPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaapiSearchItemsParameters(keyword: $keyword, resources: $resources, searchIndex: $searchIndex, itemCount: $itemCount, itemPage: $itemPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaapiSearchItemsParameters'))
      ..add(DiagnosticsProperty('keyword', keyword))
      ..add(DiagnosticsProperty('resources', resources))
      ..add(DiagnosticsProperty('searchIndex', searchIndex))
      ..add(DiagnosticsProperty('itemCount', itemCount))
      ..add(DiagnosticsProperty('itemPage', itemPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaapiSearchItemsParameters &&
            (identical(other.keyword, keyword) ||
                const DeepCollectionEquality()
                    .equals(other.keyword, keyword)) &&
            (identical(other.resources, resources) ||
                const DeepCollectionEquality()
                    .equals(other.resources, resources)) &&
            (identical(other.searchIndex, searchIndex) ||
                const DeepCollectionEquality()
                    .equals(other.searchIndex, searchIndex)) &&
            (identical(other.itemCount, itemCount) ||
                const DeepCollectionEquality()
                    .equals(other.itemCount, itemCount)) &&
            (identical(other.itemPage, itemPage) ||
                const DeepCollectionEquality()
                    .equals(other.itemPage, itemPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(keyword) ^
      const DeepCollectionEquality().hash(resources) ^
      const DeepCollectionEquality().hash(searchIndex) ^
      const DeepCollectionEquality().hash(itemCount) ^
      const DeepCollectionEquality().hash(itemPage);

  @JsonKey(ignore: true)
  @override
  _$PaapiSearchItemsParametersCopyWith<_PaapiSearchItemsParameters>
      get copyWith => __$PaapiSearchItemsParametersCopyWithImpl<
          _PaapiSearchItemsParameters>(this, _$identity);
}

abstract class _PaapiSearchItemsParameters
    implements PaapiSearchItemsParameters {
  const factory _PaapiSearchItemsParameters(
      {String? keyword,
      List<String> resources,
      String? searchIndex,
      int? itemCount,
      int? itemPage}) = _$_PaapiSearchItemsParameters;

  @override // 検索キーワードまたはフレーズ
  String? get keyword => throw _privateConstructorUsedError;
  @override // 欲しいレスポンス情報
  List<String> get resources => throw _privateConstructorUsedError;
  @override // 検索対象の製品カテゴリ
  String? get searchIndex => throw _privateConstructorUsedError;
  @override // 幾つの検索結果を返却するか
  int? get itemCount => throw _privateConstructorUsedError;
  @override // 検索結果のうちの何ページを目を返却するか
  int? get itemPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaapiSearchItemsParametersCopyWith<_PaapiSearchItemsParameters>
      get copyWith => throw _privateConstructorUsedError;
}
