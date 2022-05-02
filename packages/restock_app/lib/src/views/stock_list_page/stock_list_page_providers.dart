import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/me/me.dart';
import '../../core/stock/stock_entity.dart';
import '../../core/stock/stock_repository.dart';
import '../../my_stock/my_stock_category.dart';
import '../../util/shared_preferences_service.dart';
import 'stock_list_filter_state.dart';
import 'stock_list_sort_selection.dart';

/// すべてのストックリスト
final allStockListProvider = Provider.autoDispose<List<StockEntity>?>((ref) {
  final stockList = ref.watch(stockEntityListProvider);
  return stockList;
});

/// 登録されているストックグループのリストを提供する
final stockCategoriesProvider = Provider<List<String>?>((ref) {
  final me = ref.watch(meEntityProvider);
  if (me == null) {
    return null;
  }
  final groups = me.groups;
  return groups;
});

/// グループごとのストックリスト
final groupedStocksProvider =
    Provider.family.autoDispose<List<StockEntity>?, String?>((ref, group) {
  final allStocks = ref.watch(allStockListProvider);
  if (allStocks == null) {
    // 取得前
    return null;
  }
  if (allStocks.isEmpty) {
    // 0
    return [];
  }
  if (group == null) {
    // グループ指定がない場合はすべてのストックを返す
    return allStocks;
  }
  // アイテムの絞り込みを行う
  final filteredItems = allStocks.where((stock) {
    // アイテムのグループ
    return group == stock.stockCategory;
  }).toList();

  return filteredItems;
});

final filteredStocksProvider =
    Provider.family.autoDispose<List<StockEntity>, String?>((ref, category) {
  final filterState = ref.watch(stockFilterProvider);
  final unfiltererd = ref.watch(groupedStocksProvider(category));

  // 在庫有無
  final firstFilterd = filterState.inventory.isYes
      ? unfiltererd?.where((e) => e.numberOfItems > 0)
      : filterState.inventory.isNo
          ? unfiltererd?.where((e) => e.numberOfItems == 0)
          : unfiltererd;
  // 期限有無
  final secondFiltered = filterState.expiration.isYes
      ? firstFilterd?.where((e) => !e.isNonExpiration)
      : filterState.expiration.isNo
          ? firstFilterd?.where((e) => e.isNonExpiration)
          : firstFilterd;
  // 商品の種類
  final thirdFiltered = filterState.category.isYes
      ? secondFiltered
          ?.where((e) => e.productCategory == MyStockCategory.grocery.string)
      : filterState.category.isNo
          ? secondFiltered
              ?.where((e) => e.productCategory == MyStockCategory.others.string)
          : secondFiltered;
  return thirdFiltered?.toList() ?? [];
});

/// 検索中の文字列状態
final searchTextProvider = StateProvider<String>((ref) => '');

/// 文字列検索で絞り込んだストックリスト
final searchedStocksProvider =
    Provider.family.autoDispose<List<StockEntity>, String?>((ref, category) {
  final beforeStocks = ref.watch(filteredStocksProvider(category));
  if (beforeStocks.isEmpty) {
    return [];
  }
  final searchText = ref.watch(searchTextProvider);
  if (searchText.isEmpty) {
    return beforeStocks;
  }
  return beforeStocks
      .where(
        (e) => e.name.value.toLowerCase().contains(searchText.toLowerCase()),
      )
      .toList();
});

/// ストック一覧の並び替え設定
final stockSortingProvider = StateProvider<StockSortSelection>(
  (ref) => ref.watch(sharedPreferencesServiceProvider).getStockSorting,
);

/// 並び替えをしたマイストックリスト
final sortedStocksProvider =
    Provider.family.autoDispose<List<StockEntity>, String?>((ref, category) {
  final stocks = ref.watch(searchedStocksProvider(category));
  final sorting = ref.watch(stockSortingProvider);
  if (stocks.isEmpty) {
    return [];
  }
  // 並び替え設定によって順序をソート
  return [
    ...stocks
      ..sort((a, b) {
        switch (sorting) {
          // 期限 / 近い
          case StockSortSelection.expirationNear:
            if (a.expirationAt == null) {
              return 1;
            }
            if (b.expirationAt == null) {
              return 0;
            }
            return a.expirationAt!.compareTo(b.expirationAt!);

          // 期限 / 遠い
          case StockSortSelection.expirationFar:
            if (a.expirationAt == null) {
              return 1;
            }
            if (b.expirationAt == null) {
              return 0;
            }
            return b.expirationAt!.compareTo(a.expirationAt!);

          // 名前 / 昇順
          case StockSortSelection.nameAsc:
            return a.name.value.compareTo(b.name.value);

          // 名前 / 降順
          case StockSortSelection.nameDesc:
            return b.name.value.compareTo(a.name.value);

          // メモ / 昇順
          case StockSortSelection.memoAsc:
            if (a.memo == null) {
              return 1;
            }
            if (b.memo == null) {
              return 0;
            }
            return a.memo!.compareTo(b.memo!);

          // メモ / 降順
          case StockSortSelection.memoDesc:
            if (a.memo == null) {
              return 1;
            }
            if (b.memo == null) {
              return 0;
            }
            return b.memo!.compareTo(a.memo!);
        }
      })
  ];
});

/// 引数で指定したグループのストックリストが持つストックの数
final stockCountProvider =
    Provider.family.autoDispose<int?, String?>((ref, group) {
  final list = group == null
      ? ref.watch(allStockListProvider)
      : ref.watch(sortedStocksProvider(group));
  return list?.length;
});

final selectedTabIndexProvider = StateProvider<int>((ref) => 0);
