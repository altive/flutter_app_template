import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class RecommendDetailPage extends HookWidget {
  // Constructor
  const RecommendDetailPage({
    Key? key,
  }) : super(key: key);

  // Field
  static const String routeName = '/recommend-detail';

  // Methods
  @override
  Widget build(BuildContext context) {
    final state = useProvider(recommendDetailProvider);
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

class _ListView extends HookWidget {
  const _ListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = useProvider(recommendDetailProvider.notifier);
    final state = useProvider(recommendDetailProvider);
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

class RecommendCell extends HookWidget {
  const RecommendCell({
    Key? key,
    this.item,
    this.description,
  }) : super(key: key);

  final PaapiSearchItem? item;
  final String? description;

  @override
  Widget build(BuildContext context) {
    // asin で絞ったストックリスト
    final stocks =
        useProvider(stockEntityFilteredAsinListProvider(item!.asin!));
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
          mainAxisSize: MainAxisSize.max,
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
    BuildContext context, {
    required PaapiSearchItem searchItem,
  }) {
    final stock = StockEntity.fromSearchedAmazonItem(searchItem);
    final param = StockEditorParameter.createrWithAmazon(stock: stock);
    context.read(stockEditorParameterProvider).state = param;
    Navigator.of(context).pushNamed(StockEditorPage.routeName);
  }
}
