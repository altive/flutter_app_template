import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'stock_detail_page_controller.dart';

/// アイテム名
class StockDetailNameTile extends HookConsumerWidget {
  const StockDetailNameTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(
      stockForStockDetailProvider.select<String?>((value) => value?.name.value),
    );
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
