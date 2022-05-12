import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/remote_config/recommend_stock_set_parameter.dart';
import 'recommend_detail/recommend_detail_controller.dart';
import 'recommend_detail/recommend_detail_page.dart';

/// お勧めストックセットの概要を表示するCell
class StockSetCell extends HookConsumerWidget {
  const StockSetCell({
    required this.stockSet,
  });

  final RecommendStockSet stockSet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(MdiIcons.fromString(stockSet.iconName)),
      title: Text(stockSet.title),
      subtitle: Text(stockSet.subtitle),
      trailing: const Icon(MdiIcons.chevronRight),
      onTap: () => navigateDetailPage(ref, context, stockSet: stockSet),
    );
  }

  /// お勧め商品セットの詳細説明ページへ遷移
  void navigateDetailPage(
    WidgetRef ref,
    BuildContext context, {
    required RecommendStockSet stockSet,
  }) {
    ref.read(recommendDetailParameterProvider.state).state = stockSet;
    Navigator.of(context).pushNamed(RecommendDetailPage.routeName);
  }
}
