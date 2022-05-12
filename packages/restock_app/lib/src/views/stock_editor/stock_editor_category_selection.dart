import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../my_stock/my_stock_category.dart';
import '../../utils/utils.dart';
import 'stock_editor_controller.dart';

/// 期限の種類を選択する
class StockEditorCategorySelection extends HookConsumerWidget {
  const StockEditorCategorySelection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentCategory =
        ref.watch(stockEditorPageControllerProvider).productCategory;
    return ColoredBox(
      color: Theme.of(context).backgroundColor,
      child: ListTile(
        dense: true,
        leading: Text(
          '商品の種類',
          style: theme.textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: CupertinoSlidingSegmentedControl<MyStockCategory>(
          padding: EdgeInsets.zero,
          groupValue: currentCategory,
          children: {
            for (final category in MyStockCategory.values)
              category: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Text(category.displayLabel),
              ),
          },
          onValueChanged: (selectedCategory) {
            logger.finest('Changed to $selectedCategory');
            ref
                .read(stockEditorPageControllerProvider.notifier)
                .changeCategory(selectedCategory!);
          },
        ),
      ),
    );
  }
}
