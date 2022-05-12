import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/single_selection_list_page.dart';
import 'stock_editor_controller.dart';

/// グループを選択できる
class StockEditorPlaceField extends HookConsumerWidget {
  const StockEditorPlaceField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final stockCategory =
        ref.watch(stockEditorPageControllerProvider).stockCategory;

    return ColoredBox(
      color: theme.backgroundColor,
      child: ListTile(
        dense: true,
        leading: Text(
          'グループ',
          style: theme.textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                stockCategory ?? '未選択',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () =>
            _onTap(ref: ref, context: context, currentPlace: stockCategory),
      ),
    );
  }

  Future<void> _onTap({
    required WidgetRef ref,
    required BuildContext context,
    required String? currentPlace,
  }) async {
    final stockCategory =
        await ref.read(stockEditorPageControllerProvider.notifier).getPlaces();
    // グループ選択画面へ遷移
    final selectedPlace = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => SingleSelectableListPage(
          values: stockCategory,
          initialValue: currentPlace,
          pageTitle: 'グループを選択',
        ),
      ),
    );
    if (selectedPlace == null) {
      return;
    }
    // 選択したグループで更新する
    ref
        .read(stockEditorPageControllerProvider.notifier)
        .updatePlace(selectedPlace);
  }
}
