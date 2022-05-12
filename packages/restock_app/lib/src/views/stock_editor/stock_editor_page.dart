import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/primary_button.dart';
import '../../common_widgets/unfocus_on_tap.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../util/item_image_display.dart';
import 'stock_editor_category_selection.dart';
import 'stock_editor_controller.dart';
import 'stock_editor_count_field.dart';
import 'stock_editor_expiration_selection.dart';
import 'stock_editor_mode.dart';
import 'stock_editor_name_field.dart';
import 'stock_editor_notification_tile.dart';
import 'stock_editor_place_field.dart';
import 'stock_editor_state.dart';
import 'stock_editor_view_component.dart';

/// ストックアイテムを登録・更新・複製する画面
class StockEditorPage extends HookConsumerWidget {
  // === Constructor ===
  StockEditorPage();

  // === Field ===
  static const String routeName = '/stock-editor';

  // フォーカス
  final FocusNode _titleFocus = FocusNode();
  final FocusNode _numberFocus = FocusNode();

  // === Methods ===
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const spacer = SizedBox(height: 8);
    const divider = SizedBox(height: 1);

    final state = ref.watch(stockEditorPageControllerProvider);
    final controller = ref.watch(stockEditorPageControllerProvider.notifier);
    final mode = controller.param!.mode!;

    return _PopHandlingView(
      child: UnfocusOnTap(
        child: LoadingIndicator(
          loading: state.loading,
          child: Scaffold(
            appBar: AppBar(
              title: Text(mode.title),
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  ItemImageDisplay(
                    imageFile: controller.param!.imageFile,
                    imageUrl: state.imageUrl,
                    pageUrl: state.amazonUrl,
                  ),
                  spacer,
                  StockEditorNameField(
                    titleFocus: _titleFocus,
                    numberFocus: _numberFocus,
                  ),
                  spacer,
                  StockEditorCountField(numberFocus: _numberFocus),
                  spacer,
                  // 複製モード時は期限の種類を再選択させない
                  if (!mode.isDuplicater)
                    const StockEditorExpirationSelection(),
                  Visibility(
                    visible:
                        state.expirationDateType != ExpirationDateType.none &&
                            !mode.isDuplicater,
                    child: divider,
                  ),
                  const ExpirationDateForm(),
                  // 複製モード時はカテゴリーを再選択させない
                  if (!mode.isDuplicater) spacer,
                  if (!mode.isDuplicater) const StockEditorCategorySelection(),
                  const StockEditorPlaceField(),
                  divider,
                  const MemoForm(),
                  spacer,
                  const StockEditorNotificationTile(),
                  PrimaryButton(
                    labelText: '保存',
                    onPressed: validate(state)
                        ? () => _popAndSave(
                              ref: ref,
                              context: context,
                              isDuplicater: mode.isDuplicater,
                            )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 保存可能かどうか検査する
  /// 保存可能であれば`true`を返す。
  bool validate(StockEditorState state) {
    return state.itemName.isNotEmpty;
  }

  /// StockItemを保存して、前の画面へ戻る
  Future<void> _popAndSave({
    required WidgetRef ref,
    required BuildContext context,
    required bool isDuplicater,
  }) async {
    await ref.read(stockEditorPageControllerProvider.notifier).saveStockItem();
    if (isDuplicater) {
      // ストックリスト画面まで一気に戻る
      Navigator.of(context).pop();
      return Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop('保存しました');
    }
  }
}

/// 前の画面へ戻ろうとしたときに確認する
class _PopHandlingView extends HookConsumerWidget {
  const _PopHandlingView({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasChanged = ref.watch(stockEditorPageControllerProvider).hasChanged;
    return WillPopScope(
      onWillPop: () async {
        if (!hasChanged) {
          return true;
        }
        final result = await showOkCancelAlertDialog(
          context: context,
          title: '確認',
          message: '編集内容は保存されていません。',
          okLabel: '破棄',
          cancelLabel: 'キャンセル',
          isDestructiveAction: true,
          defaultType: OkCancelAlertDefaultType.cancel,
        );

        switch (result) {
          case OkCancelResult.ok:
            return true;
          case OkCancelResult.cancel:
            return false;
        }
      },
      child: child,
    );
  }
}
