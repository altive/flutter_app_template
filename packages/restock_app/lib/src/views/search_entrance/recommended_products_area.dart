import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/list_section_header.dart';
import '../../common_widgets/url_image.dart';
import 'search_entrance_controller.dart';

class RecommendedProductsArea extends HookConsumerWidget {
  const RecommendedProductsArea();

  static const horizontalCellCount = 3;
  static const horizontalPadding = 16.0;
  static const cellSpacing = 8.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final cellWidth = (width -
            horizontalPadding * 2 -
            cellSpacing * (horizontalCellCount - 1)) /
        horizontalCellCount;
    // 端数を含めてしまうと指定個数のセルを表示しきれなくなるので、小数点以下を切り捨てる
    final flooredCellWidth = cellWidth.floorToDouble();

    final items = ref.watch(searchEntranceProvider).recommendProducts;
    if (items == null) {
      return const SizedBox();
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ListSectionHeader(
            title: 'オススメの備蓄品です',
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          Wrap(
            spacing: cellSpacing,
            runSpacing: 20,
            children: <Widget>[
              for (final item in items)
                ProductCell(
                  size: flooredCellWidth,
                  item: item,
                ),
            ],
          )
        ],
      ),
    );
  }
}

/// オススメ商品を表示するセル
class ProductCell extends HookConsumerWidget {
  const ProductCell({
    required this.size,
    required this.item,
  });

  final double size;
  final PaapiSearchItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 再背面に背景色を設定
    return Material(
      color: Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: () {
          ref
              .read(searchEntranceProvider.notifier)
              .presentStockEditorPage(ref, item, context);
        },
        child: SizedBox(
          width: size,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: size,
                child: UrlImage(
                  item.largeImageUrl,
                  width: 100,
                  height: 100,
                ),
              ),
              CaptionTextPadding(
                child: Text(
                  item.displayTitle!,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
              CaptionTextPadding(
                child: Text(
                  // 価格情報がない=nullの場合がある
                  item.displayAmount ?? '',
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CaptionTextPadding extends StatelessWidget {
  const CaptionTextPadding({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: child,
    );
  }
}
