import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../core/me/me.dart';
import '../../my_account/ng_words.dart';

class AccountSettingNicknameTile extends HookWidget {
  // Constructor
  const AccountSettingNicknameTile({
    Key? key,
  }) : super(key: key);

  // Methods
  @override
  Widget build(BuildContext context) {
    final me = useProvider(meEntityProvider);
    if (me == null) {
      return const LoadingIndicator();
    }
    final nickname = me.nickname;
    if (nickname == null || nickname.isEmpty) {
      useProvider(meRepositoryProvider)?.addNickname();
    }
    return ListTile(
      leading: const Icon(MdiIcons.alphabetical),
      title: const Text('ニックネーム'),
      subtitle: Text('「${nickname ?? ''}」さん'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        final results = await showTextInputDialog(
          context: context,
          title: 'ニックネームを変更',
          message: '2文字以上15文字以内でご入力ください',
          okLabel: '変更',
          textFields: [
            DialogTextField(
              initialText: nickname ?? '',
              hintText: 'ニックネームを入力',
              validator: (value) {
                if (value!.length < 2) {
                  return '2文字以上入力ください';
                }
                if (value.length > 15) {
                  return '15文字以下で入力ください';
                }
                if (ngWords.any((word) => value.contains(word))) {
                  return 'NGワードが含まれています';
                }
                return null;
              },
            ),
          ],
        );
        if (results == null) {
          // キャンセルパターン
          return;
        }
        // ニックネームを更新
        await context.read(meRepositoryProvider)?.updateNickname(results.first);
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(content: Text('ニックネームを変更しました')),
          );
      },
    );
  }
}
