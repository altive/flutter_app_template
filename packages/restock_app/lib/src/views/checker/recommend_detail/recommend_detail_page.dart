import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/loading_indicator.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../common_widgets/secondary_button.dart';
import '../../../core/stock/stock_entity.dart';
import '../../../core/stock/stock_repository.dart';
import '../../../util/web_launcher.dart';
import '../../stock_editor/stock_editor_controller.dart';
import '../../stock_editor/stock_editor_page.dart';
import '../../stock_editor/stock_editor_parameter.dart';
import 'recommend_detail_cell.dart';
import 'recommend_detail_controller.dart';

class RecommendDetailPage extends HookConsumerWidget {
  // Constructor
  const RecommendDetailPage();

  // Field
  static const String routeName = '/recommend-detail';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recommendDetailProvider);
    return LoadingIndicator(
      loading: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('セット紹介')),
        body: SafeArea(
          child: state.fetching ? const LoadingIndicator() : const _ListView(),
        ),
      ),
    );
  }
}

class _ListView extends HookConsumerWidget {
  const _ListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final controller = ref.watch(recommendDetailProvider.notifier);
    final state = ref.watch(recommendDetailProvider);
    final items = state.itemResult!.items;
    final recommendStocks = controller.setList!;

    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      children: [
        Text(
          recommendStocks.title,
          style: theme.textTheme.headline5!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          recommendStocks.description,
          style: theme.textTheme.bodyText1,
        ),
        const SizedBox(height: 16),
        ...items
            .asMap()
            .map(
              (index, item) => MapEntry(
                index,
                RecommendCell(
                  item: item,
                  description: recommendStocks.itemList[index].description,
                ),
              ),
            )
            .values
            .toList(),
      ],
    );
  }
}

class RecommendCell extends HookConsumerWidget {
  const RecommendCell({
    this.item,
    this.description,
  });

  final PaapiSearchItem? item;
  final String? description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // asin で絞ったストックリスト
    final stocks = ref.watch(stockEntityFilteredAsinListProvider(item!.asin!));
    if (stocks == null) {
      return const SizedBox(height: 220, child: LoadingIndicator());
    }
    final count =
        stocks.fold<double>(0, (a, b) => a + b!.numberOfItems).toInt();
    return Column(
      children: [
        RecommendDetailCell(
          count: count,
          item: item,
        ),
        Row(
          children: [
            FittedBox(
              child: Image.asset(
                'assets/images/res_center_facing.png',
                color: Theme.of(context).colorScheme.primary,
                width: 40,
                height: 40,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
                decoration: ShapeDecoration(
                  color: Theme.of(context).bottomAppBarColor,
                  shape: const BubbleBorder(),
                ),
                child: Card(
                  color: Theme.of(context).bottomAppBarColor,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: Text(
                      description!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        // ボタン群
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SecondaryButton(
                labelText: 'Amazon',
                onPressed: () => showAmazonPage(item!.detailPageUrl),
              ),
            ),
            Expanded(
              child: PrimaryButton(
                labelText: '登録',
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                onPressed: () => navigateToStockEditPage(
                  ref,
                  context,
                  searchItem: item!,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  /// Amazonで商品ページを開く
  void showAmazonPage(String? url) {
    launchUrl(url);
  }

  /// ストック編集（登録）ページに遷移する
  void navigateToStockEditPage(
    WidgetRef ref,
    BuildContext context, {
    required PaapiSearchItem searchItem,
  }) {
    final stock = StockEntity.fromSearchedAmazonItem(searchItem);
    final param = StockEditorParameter.createrWithAmazon(stock: stock);
    ref.read(stockEditorParameterProvider.state).state = param;
    Navigator.of(context).pushNamed(StockEditorPage.routeName);
  }
}
