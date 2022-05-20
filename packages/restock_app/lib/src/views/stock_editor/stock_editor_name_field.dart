import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'stock_editor_controller.dart';

/// アイテムの名前を入力するフォーム
class StockEditorNameField extends HookConsumerWidget {
  const StockEditorNameField({
    required this.titleFocus,
    required this.numberFocus,
  });

  final FocusNode titleFocus;
  final FocusNode numberFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    // HookのTextEditingControllerを使用
    final initialName = ref.watch(stockEditorPageControllerProvider).itemName;
    final controller = useTextEditingController(text: initialName);
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        // 写真登録等の場合は商品名が無いので最初にフォーカスを当てる
        autofocus: controller.text.isEmpty,
        focusNode: titleFocus,
        textInputAction: TextInputAction.next,
        minLines: 1,
        maxLines: 4,
        decoration: const InputDecoration(
          border: InputBorder.none,
          labelText: 'ストックアイテム名',
        ),
        style: theme.textTheme.bodyText2,
        onChanged: (_) {
          // アイテム名の更新を状態に反映する
          ref
              .read(stockEditorPageControllerProvider.notifier)
              .changeItemName(controller.text);
        },
        onSubmitted: (_) {
          // 次の入力欄へ
          FocusScope.of(context).requestFocus(numberFocus);
        },
      ),
    );
  }
}
