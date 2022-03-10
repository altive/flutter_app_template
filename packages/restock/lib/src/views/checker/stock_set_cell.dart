import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/remote_config/recommend_stock_set_parameter.dart';
import 'recommend_detail/recommend_detail_controller.dart';
import 'recommend_detail/recommend_detail_page.dart';

/// お勧めストックセットの概要を表示するCell
class StockSetCell extends HookWidget {
  const StockSetCell({
    Key? key,
    required this.stockSet,
  }) : super(key: key);

  final RecommendStockSet stockSet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(MdiIcons.fromString(stockSet.iconName)),
      title: Text(stockSet.title),
      subtitle: Text(stockSet.subtitle),
      trailing: const Icon(MdiIcons.chevronRight),
      onTap: () => navigateDetailPage(context, stockSet: stockSet),
    );
  }

  /// お勧め商品セットの詳細説明ページへ遷移
  void navigateDetailPage(
    BuildContext context, {
    required RecommendStockSet stockSet,
  }) {
    context.read(recommendDetailParameterProvider).state = stockSet;
    Navigator.of(context).pushNamed(RecommendDetailPage.routeName);
  }
}
