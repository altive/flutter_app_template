// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'paapi_search_items_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_PaapiSearchItemsParametersCopyWith<$Res>
    implements $PaapiSearchItemsParametersCopyWith<$Res> {
  factory _$$_PaapiSearchItemsParametersCopyWith(
          _$_PaapiSearchItemsParameters value,
          $Res Function(_$_PaapiSearchItemsParameters) then) =
      __$$_PaapiSearchItemsParametersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? keyword,
      List<String> resources,
      String? searchIndex,
      int? itemCount,
      int? itemPage});
}

/// @nodoc
class __$$_PaapiSearchItemsParametersCopyWithImpl<$Res>
    extends _$PaapiSearchItemsParametersCopyWithImpl<$Res>
    implements _$$_PaapiSearchItemsParametersCopyWith<$Res> {
  __$$_PaapiSearchItemsParametersCopyWithImpl(
      _$_PaapiSearchItemsParameters _value,
      $Res Function(_$_PaapiSearchItemsParameters) _then)
      : super(_value, (v) => _then(v as _$_PaapiSearchItemsParameters));

  @override
  _$_PaapiSearchItemsParameters get _value =>
      super._value as _$_PaapiSearchItemsParameters;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? resources = freezed,
    Object? searchIndex = freezed,
    Object? itemCount = freezed,
    Object? itemPage = freezed,
  }) {
    return _then(_$_PaapiSearchItemsParameters(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      resources: resources == freezed
          ? _value._resources
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
      final List<String> resources = const <String>[],
      this.searchIndex,
      this.itemCount,
      this.itemPage})
      : _resources = resources;

// 検索キーワードまたはフレーズ
  @override
  final String? keyword;
// 欲しいレスポンス情報
  final List<String> _resources;
// 欲しいレスポンス情報
  @override
  @JsonKey()
  List<String> get resources {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resources);
  }

// 検索対象の製品カテゴリ
  @override
  final String? searchIndex;
// 幾つの検索結果を返却するか
  @override
  final int? itemCount;
// 検索結果のうちの何ページを目を返却するか
  @override
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
        (other.runtimeType == runtimeType &&
            other is _$_PaapiSearchItemsParameters &&
            const DeepCollectionEquality().equals(other.keyword, keyword) &&
            const DeepCollectionEquality()
                .equals(other._resources, _resources) &&
            const DeepCollectionEquality()
                .equals(other.searchIndex, searchIndex) &&
            const DeepCollectionEquality().equals(other.itemCount, itemCount) &&
            const DeepCollectionEquality().equals(other.itemPage, itemPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(keyword),
      const DeepCollectionEquality().hash(_resources),
      const DeepCollectionEquality().hash(searchIndex),
      const DeepCollectionEquality().hash(itemCount),
      const DeepCollectionEquality().hash(itemPage));

  @JsonKey(ignore: true)
  @override
  _$$_PaapiSearchItemsParametersCopyWith<_$_PaapiSearchItemsParameters>
      get copyWith => __$$_PaapiSearchItemsParametersCopyWithImpl<
          _$_PaapiSearchItemsParameters>(this, _$identity);
}

abstract class _PaapiSearchItemsParameters
    implements PaapiSearchItemsParameters {
  const factory _PaapiSearchItemsParameters(
      {final String? keyword,
      final List<String> resources,
      final String? searchIndex,
      final int? itemCount,
      final int? itemPage}) = _$_PaapiSearchItemsParameters;

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
  _$$_PaapiSearchItemsParametersCopyWith<_$_PaapiSearchItemsParameters>
      get copyWith => throw _privateConstructorUsedError;
}
