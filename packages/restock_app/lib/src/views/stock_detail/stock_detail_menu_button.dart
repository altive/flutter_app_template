import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/stock/stock_entity.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';
import 'stock_detail_page_controller.dart';

/// アクションメニュー内容
enum DetailMenuAction {
  update,
  duplicate,
  deletion,
}

extension Ex on DetailMenuAction {
  String? get label {
    switch (this) {
      case DetailMenuAction.update:
        return '編集';
      case DetailMenuAction.duplicate:
        return '複製';
      case DetailMenuAction.deletion:
        return '削除';
    }
  }

  Icon? get icon {
    switch (this) {
      case DetailMenuAction.update:
        return const Icon(Icons.edit);
      case DetailMenuAction.duplicate:
        return const Icon(Icons.content_copy);
      case DetailMenuAction.deletion:
        return const Icon(Icons.delete);
    }
  }
}

/// ストックアイテムを編集・削除等するためのPopupMenu
class StockDetailMenuButton extends HookConsumerWidget {
  const StockDetailMenuButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stock = ref.watch(stockForStockDetailProvider);
    if (stock == null) {
      return const SizedBox();
    }
    return PopupMenuButton<DetailMenuAction>(
      padding: const EdgeInsets.only(right: 16),
      itemBuilder: (context) => DetailMenuAction.values
          .map(
            (action) => PopupMenuItem(
              value: action,
              child: Row(
                children: [
                  action.icon!,
                  const SizedBox(width: 8),
                  Text(action.label!),
                ],
              ),
            ),
          )
          .toList(),
      onSelected: (action) async {
        switch (action) {
          case DetailMenuAction.update:
            return _handleEditAction(
              ref: ref,
              context: context,
              stock: stock,
            );

          case DetailMenuAction.deletion:
            return _handleDeleteAction(
              ref: ref,
              context: context,
              stockName: stock.name.value,
            );

          case DetailMenuAction.duplicate:
            return _handleDuplicateAction(
              ref: ref,
              context: context,
              stock: stock,
            );
        }
      },
    );
  }

  Future<void> _handleEditAction({
    required WidgetRef ref,
    required BuildContext context,
    required StockEntity stock,
  }) async {
    // 編集画面で必要なParameterをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.updater(stock: stock);
    final result = await Navigator.of(context).pushNamed(
      StockEditorPage.routeName,
    );
    if (result != null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('$result')));
    }
  }

  Future<void> _handleDeleteAction({
    required WidgetRef ref,
    required BuildContext context,
    required String stockName,
  }) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: '本当に削除しますか？',
      message: '削除すると元に戻せません',
      isDestructiveAction: true,
      defaultType: OkCancelAlertDefaultType.cancel,
      okLabel: '削除',
      cancelLabel: 'キャンセル',
    );
    if (result == OkCancelResult.cancel) {
      return;
    }
    // 通知をOFFにする
    await ref
        .read(stockDetailPageControllerProvider.notifier)
        .removeNotification();

    await ref.read(stockDetailPageControllerProvider.notifier).deleteItem();
    Navigator.of(context).pop('$stockNameを削除しました');
  }

  Future<void> _handleDuplicateAction({
    required WidgetRef ref,
    required BuildContext context,
    required StockEntity stock,
  }) async {
    // 複製画面で必要なParameterをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.duplicater(stock: stock);
    await Navigator.of(context).pushNamed(StockEditorPage.routeName);
  }
}
