import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'stock_detail_page_controller.dart';

/// アイテムの個数を表示し、増減ボタンもある
class StockDetailCounterView extends HookConsumerWidget {
  const StockDetailCounterView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfItems = ref.watch(
      stockForStockDetailProvider
          .select<int?>((value) => value?.numberOfItems.toInt()),
    );
    if (numberOfItems == null) {
      return const SizedBox();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(MdiIcons.plusCircle),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: numberOfItems < 99
                  ? () => _incrementItem(
                        ref: ref,
                        context: context,
                        itemCount: numberOfItems,
                      )
                  : null,
            ),
            IconButton(
              icon: const Icon(MdiIcons.minusCircle),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: numberOfItems > 0
                  ? () => _decrementItem(
                        ref: ref,
                        context: context,
                        itemCount: numberOfItems,
                      )
                  : null,
            ),
            IconButton(
              icon: const Icon(MdiIcons.numeric0Circle),
              color: Theme.of(context).colorScheme.primary,
              onPressed: numberOfItems > 1
                  ? () => _reduceItemToZero(
                        ref: ref,
                        context: context,
                      )
                  : null,
            ),
          ],
        ),
      ],
    );
  }

  /// アイテムを1個増やす
  Future<void> _incrementItem({
    required WidgetRef ref,
    required BuildContext context,
    required int itemCount,
  }) async {
    await ref.read(stockDetailPageControllerProvider.notifier).incrementItem();
    // トーストを表示する
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('ストックの在庫を1つ増やしました')),
      );
  }

  /// アイテムを1個減らす
  Future<void> _decrementItem({
    required WidgetRef ref,
    required BuildContext context,
    required int itemCount,
  }) async {
    await ref.read(stockDetailPageControllerProvider.notifier).decrementItem();
    if (itemCount == 1) {
      return _onZeroCount(
        ref: ref,
        context: context,
      );
    }
    // トーストを表示する
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(content: Text('ストックの在庫を1つ減らしました')),
      );
  }

  /// アイテムを0個にする
  Future<void> _reduceItemToZero({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: '0個にしますか？',
      isDestructiveAction: true,
    );
    if (result == OkCancelResult.cancel) {
      // キャンセル
      return;
    }
    final isSucceeded = await ref
        .read(stockDetailPageControllerProvider.notifier)
        .reduceItemToZero();
    if (isSucceeded) {
      return _onZeroCount(
        ref: ref,
        context: context,
      );
    }
  }

  /// アイテムが0個になった時
  Future<void> _onZeroCount({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    // 通知をOFFにする
    await ref
        .read(stockDetailPageControllerProvider.notifier)
        .removeNotification();

    final result = await showOkCancelAlertDialog(
      context: context,
      title: '在庫が0になりました',
      message: 'このアイテムを削除しますか？もしくは「在庫なし」として残しますか？',
      okLabel: '削除',
      cancelLabel: '残す',
      isDestructiveAction: true,
      defaultType: OkCancelAlertDefaultType.cancel,
    );

    switch (result) {
      case OkCancelResult.ok:
        // アイテムを削除してリスト画面へ戻る
        Navigator.of(context).pop('削除しました');
        await ref.read(stockDetailPageControllerProvider.notifier).deleteItem();
        break;
      case OkCancelResult.cancel:
        break;
    }
  }
}
