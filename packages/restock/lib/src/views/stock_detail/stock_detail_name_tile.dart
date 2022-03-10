import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'stock_detail_page_controller.dart';

/// アイテム名
class StockDetailNameTile extends HookWidget {
  const StockDetailNameTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name =
        useProvider(stockForStockDetailProvider.select((value) => value?.name));
    final theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Text(
        name ?? '',
        style: theme.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
