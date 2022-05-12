import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_widgets/list_section_header.dart';
import '../../core/me/me.dart';
import '../../core/me/me_validator.dart';
import '../../core/revenue/revenue.dart';
import '../pro_plan/pro_plan_page.dart';
import 'place_editor_card.dart';
import 'place_editor_controller.dart';

class PlaceEditorPage extends HookConsumerWidget {
  const PlaceEditorPage();

  static const String routeName = '/place-editor';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final me = ref.watch(meEntityProvider)!;
    final isProUser = ref.watch(
      revenueControllerProvider.select<bool>((value) => value.isSubscriber),
    );
    final stockCategories = me.groups!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('グループ'),
        actions: [
          AddButton(count: stockCategories.length),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ListSectionHeader(
              title: 'ジャンル分けや保管場所の整理にご利用ください。\nタップして名前変更・長押しで並び替えができます',
            ),
            if (!isProUser && stockCategories.length > 2)
              Card(
                elevation: 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: Theme.of(context).colorScheme.primary,
                child: ListTile(
                  leading: const Icon(MdiIcons.diamondStone),
                  title: const Text('更にグループの追加が可能に!'),
                  subtitle: const Text('Proプランについてはこちら'),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                  onTap: () => _pushToProPlanPage(context),
                ),
              ),
            Expanded(
              child: ReorderableListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                onReorder: (oldIndex, newIndex) => _onReorder(
                  ref: ref,
                  context: context,
                  oldIndex: oldIndex,
                  newIndex: newIndex,
                  categories: stockCategories,
                ),
                children: stockCategories
                    .asMap()
                    .map<int, Dismissible>(
                      (index, place) => MapEntry(
                        index,
                        Dismissible(
                          key: Key(place),
                          direction: DismissDirection.startToEnd,
                          background: const DeletableBackground(
                            label: '削除',
                            margin: EdgeInsets.all(4),
                          ),
                          confirmDismiss: (direction) => _confirm(
                            context: context,
                            direction: direction,
                          ),
                          onDismissed: (direction) => _onDismissed(
                            ref: ref,
                            context: context,
                            direction: direction,
                            category: place,
                          ),
                          child: PlaceEditorCard(
                            key: Key(place),
                            index: index,
                            stockCategories: stockCategories,
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
            const ListSectionHeader(
              title: 'タップで名前変更、長押しで並び替えができます',
            ),
          ],
        ),
      ),
    );
  }

  /// 削除前に確認
  Future<bool> _confirm({
    required BuildContext context,
    required DismissDirection direction,
  }) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      message: '削除しますか？',
      okLabel: '削除',
      cancelLabel: 'キャンセル',
      isDestructiveAction: true,
    );
    return result == OkCancelResult.ok;
  }

  /// スワイプした時の動作
  Future<void> _onDismissed({
    required WidgetRef ref,
    required BuildContext context,
    required DismissDirection direction,
    required String category,
  }) async {
    if (direction == DismissDirection.startToEnd) {
      ref.read(placeEditorPageProvider.notifier).removeCategory(category);
    }
  }

  /// 並び替え
  void _onReorder({
    required WidgetRef ref,
    required BuildContext context,
    required int oldIndex,
    required int newIndex,
    required List<String> categories,
  }) {
    // 移動前の位置から取り出す
    final category = categories.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      // 移動前のインデックスより移動後のインデックスが大きい場合、アイテムの長さがリストの保有数よりも1大きくなってしまうため、
      // newIndexから1引きます。
      // 例えば、[0]のアイテムを[2]に移動した場合、oldIndex = 0, newIndex = 3となります。
      // newIndexを1引いて[2]とします。
      // 移動後の位置に挿入する
      categories.insert(newIndex - 1, category);
    } else {
      // 移動後の位置に挿入する
      categories.insert(newIndex, category);
    }
    // 新しい保管場所リストで更新する
    ref.read(placeEditorPageProvider.notifier).updateCategories(categories);
  }

  void _pushToProPlanPage(BuildContext context) {
    Navigator.of(context).pushNamed(ProPlanPage.routeName);
  }
}

class AddButton extends ConsumerWidget {
  const AddButton({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () => _append(
        ref: ref,
        context: context,
        count: count,
      ),
      child: const Text('追加'),
    );
  }

  /// 追加
  Future<void> _append({
    required WidgetRef ref,
    required BuildContext context,
    required int count,
  }) async {
    final isProUser = ref.read(revenueControllerProvider).isSubscriber;
    if (!isProUser && count >= 3) {
      // 非Proユーザーかつ3つ以上登録している場合は追加できない
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('無料プランユーザーは3件までとなります')));
      return;
    }
    final result = await showTextInputDialog(
      context: context,
      textFields: [
        DialogTextField(
          hintText: '寝室のクローゼット',
          validator: ref.read(meValidatorProvider).validateCategory,
        ),
      ],
      title: 'グループを追加',
      okLabel: '追加',
    );
    if (result == null) {
      // Cancel
      return;
    }
    ref.read(placeEditorPageProvider.notifier).unionPlace(result.first);
  }
}
