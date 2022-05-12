import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/primary_button.dart';
import '../../core/stock/stock_entity.dart';
import '../components/loading_view.dart';
import 'stock_display_mode.dart';
import 'stock_list_grid_card.dart';
import 'stock_list_item_card.dart';
import 'stock_list_page_controller.dart';
import 'stock_list_page_providers.dart';

/// ストック一覧を表示する画面
/// 何を表示するかはグループ次第
/// アイテムをスクロール可能な縦並び表示する
class StockListView extends HookConsumerWidget {
  const StockListView({
    required this.categoryIndex,
    required this.group,
    required this.scrollController,
  });

  /// このグループの表示位置
  final int? categoryIndex;

  /// グループ文字列
  final String? group;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayMode = ref.watch(displayModeProvider);
    // グループごとのストックリスト
    final groupedStocks = ref.watch(groupedStocksProvider(group));
    if (groupedStocks == null) {
      // 取得前
      return LoadingView(text: '${group ?? 'すべて'}のストックを取得中…');
    }
    // 並び替え・絞込み適用後のストックリスト
    final filteredStocks = ref.watch(filteredStocksProvider(group));
    // 検索適用後のストックリスト
    final searchedStocks = ref.watch(searchedStocksProvider(group));
    // 並び替え適用後のストックリスト
    final sortedStocks = ref.watch(sortedStocksProvider(group));
    if (groupedStocks.isEmpty) {
      // このグループにストックがない時の表示
      return EmptyView(
        index: categoryIndex,
        category: group,
      );
    }

    if (filteredStocks.isEmpty) {
      return const NoFindedView(label: '該当するストックがありません。\n表示条件を変えてお試しください。');
    }

    if (searchedStocks.isEmpty) {
      return const NoFindedView(label: '該当するストックがありません。\n検索ワードを変えてお試しください。');
    }

    switch (displayMode) {
      case StockDisplayMode.list:
        return _ListView(
          scrollController: scrollController,
          sortedStocks: sortedStocks,
        );
      case StockDisplayMode.grid:
        return _GridView(
          scrollController: scrollController,
          sortedStocks: sortedStocks,
        );
    }
  }
}

/// リスト形式で表示する場合のView
class _ListView extends StatelessWidget {
  const _ListView({
    required this.scrollController,
    required this.sortedStocks,
  });

  final ScrollController scrollController;
  final List<StockEntity> sortedStocks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      separatorBuilder: (_, __) => const Divider(
        height: 2,
        color: Colors.transparent,
      ),
      // 検索フィールド等の余白分を加味
      padding: const EdgeInsets.fromLTRB(16, 110, 16, 16),
      itemCount: sortedStocks.length,
      itemBuilder: (context, index) {
        return HomeItemCard(
          stock: sortedStocks[index],
          isFirstItem: index == 0,
          isLastItem: index == sortedStocks.length - 1,
        );
      },
    );
  }
}

/// グリッド形式で表示する場合のView
class _GridView extends StatelessWidget {
  const _GridView({
    required this.scrollController,
    required this.sortedStocks,
  });

  final ScrollController scrollController;
  final List<StockEntity> sortedStocks;

  @override
  Widget build(BuildContext context) {
    // Widthが375である、iPhone6以降は3列以上になる
    // 逆にWidthが375未満の場合は、2列表示になる想定
    const minItemWidth = 125;
    const itemAspect = 4 / 6;
    const gridSideSpacing = 16.0;
    const itemMarginSpacing = 2.0;
    const itemPaddingSpacing = 0.0;
    const imageAspect = 3 / 4;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ minItemWidth;
    final imageHeight = (screenWidth / crossAxisCount -
            itemMarginSpacing -
            itemPaddingSpacing * 2) *
        imageAspect;
    final itemCount = sortedStocks.length;
    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: itemMarginSpacing,
        mainAxisSpacing: itemMarginSpacing,
        childAspectRatio: itemAspect,
      ),
      // 検索フィールド等の余白分を加味
      padding: const EdgeInsets.fromLTRB(
        gridSideSpacing,
        110,
        gridSideSpacing,
        16,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return StockListGridCard(
          stock: sortedStocks[index],
          isTopLeft: index == 0,
          isTopRight: index == crossAxisCount - 1 ||
              itemCount == 1 ||
              (itemCount == crossAxisCount - 1 && index == itemCount - 1),
          isBottomLeft: index == itemCount - (itemCount % crossAxisCount) ||
              (itemCount <= crossAxisCount && index == 0),
          isBottomRight: index == itemCount - 1,
          imageHeight: imageHeight,
        );
      },
    );
  }
}

/// コンテンツが見つからない時の表示
class NoFindedView extends StatelessWidget {
  const NoFindedView({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(label),
      ),
    );
  }
}

/// コンテンツが空の時に表示するWidget
class EmptyView extends ConsumerWidget {
  const EmptyView({
    required this.index,
    required this.category,
  });

  /// このグループの表示位置
  final int? index;

  /// グループ文字列
  final String? category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCategory = category != null;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 200,
                maxHeight: 200,
              ),
              decoration: BoxDecoration(
                // ダークモードの表示のためにライトモードに合わせた背景色を設定
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/images/box_mountain.png'),
            ),
          ),
          const SizedBox(height: 32),
          Text(isCategory ? 'このグループにストックはありません' : 'まだストックがありません'),
          if (isCategory)
            PrimaryButton(
              labelText: 'グループの名前を変更する',
              onPressed: () => ref
                  .read(stockListPageControllerProvider.notifier)
                  .updageCategory(
                    context: context,
                    currentCategory: category,
                    position: index,
                  ),
            ),
        ],
      ),
    );
  }
}
