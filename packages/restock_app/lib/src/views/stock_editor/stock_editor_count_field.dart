import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'stock_editor_controller.dart';

/// アイテムの個数を入力するフォーム
class StockEditorCountField extends HookConsumerWidget {
  const StockEditorCountField({
    required this.numberFocus,
  });

  final FocusNode numberFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // TextEditingControllerに初期値代入
    final numberOfItems =
        ref.watch(stockEditorPageControllerProvider).numberOfItems;
    final controller = useTextEditingController(text: numberOfItems.toString());
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: numberFocus,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: '個数（最大99個）',
              ),
              style: theme.textTheme.bodyText2,
              onChanged: (_) {
                ref
                    .read(stockEditorPageControllerProvider.notifier)
                    .changeNumberOfItems(controller.text);
              },
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            iconSize: 32,
            icon: const Icon(MdiIcons.plusBox),
            onPressed: () {
              if (numberOfItems >= 99) {
                // 最大99個
                return;
              }
              controller.text = (int.parse(controller.text) + 1).toString();
              ref
                  .read(stockEditorPageControllerProvider.notifier)
                  .incrementNumberOfItems();
            },
          ),
          const SizedBox(width: 8),
          IconButton(
            iconSize: 32,
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            icon: const Icon(MdiIcons.minusBox),
            onPressed: () {
              if (numberOfItems < 1) {
                // マイナス値にはさせない
                return;
              }
              controller.text = (int.parse(controller.text) - 1).toString();
              ref
                  .read(stockEditorPageControllerProvider.notifier)
                  .dencrementNumberOfItems();
            },
          ),
        ],
      ),
    );
  }
}
