// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stock_items_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stockItemsStateHash() => r'2a8726e6b0ef4a5c539e532726b66674aafbf239';

/// ユーザーの備蓄品データを取得・管理するプロバイダー。
///
/// Copied from [StockItemsState].
@ProviderFor(StockItemsState)
final stockItemsStateProvider = AutoDisposeStreamNotifierProvider<
  StockItemsState,
  List<StockItem>?
>.internal(
  StockItemsState.new,
  name: r'stockItemsStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$stockItemsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StockItemsState = AutoDisposeStreamNotifier<List<StockItem>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
