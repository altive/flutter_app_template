import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../common_widgets/text_input_page.dart';

import '../../everyones_stock/expiration_date_type.dart';
import '../../utils/utils.dart';
import '../stock_editor/stock_editor_controller.dart';

/// 期限の日付を選択するフォーム
class ExpirationDateForm extends HookWidget {
  const ExpirationDateForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // State
    final dateType =
        useProvider(stockEditorPageControllerProvider).expirationDateType;
    final date =
        useProvider(stockEditorPageControllerProvider).expirationDate ??
            DateTime.now();
    final expirationDateString = DateFormat.yMMMEd().format(date);
    return Visibility(
      visible: dateType != ExpirationDateType.none,
      child: ColoredBox(
        color: Theme.of(context).backgroundColor,
        child: ListTile(
          dense: true,
          leading: Text(
            dateType.label ?? '',
            style: theme.textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Text(expirationDateString),
          trailing: const Icon(MdiIcons.calendar),
          onTap: () => _selectExpirationDate(
            context: context,
            initialDate: date,
          ),
        ),
      ),
    );
  }

  /// 賞味期限（消費期限）を選択する
  Future<void> _selectExpirationDate({
    required BuildContext context,
    required DateTime initialDate,
  }) async {
    final pickedDate = await showDatePicker(
      context: context,
      locale: const Locale('ja', 'JP'),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: initialDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );
    // 日付が選択されており、変更もされていた場合の処理
    // （カレンダー外をタップした場合は`null`が入る）
    if (pickedDate != null && pickedDate != initialDate) {
      logger.info('選択日付：${pickedDate.toIso8601String()}');
      context
          .read(stockEditorPageControllerProvider.notifier)
          .changeExpirationDate(pickedDate);
    }
  }
}

/// メモを入力できる
class MemoForm extends HookWidget {
  const MemoForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final memo = useProvider(stockEditorPageControllerProvider).memo;

    return ColoredBox(
      color: theme.backgroundColor,
      child: ListTile(
        dense: true,
        leading: Text(
          'メモ',
          style: theme.textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                memo ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // メモ入力画面へ遷移
          Navigator.of(context)
              .push<String>(
            MaterialPageRoute(
              builder: (context) => TextInputPage(
                title: 'メモを書く',
                labelText: 'メモ',
                initialText: memo,
              ),
            ),
          )
              .then(
            (newMemo) {
              // メモ入力画面で入力したメモを取得
              context
                  .read(stockEditorPageControllerProvider.notifier)
                  .updateMemo(newMemo);
            },
          );
        },
      ),
    );
  }
}
