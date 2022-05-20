import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'account_setting_page_controller.dart';

/// アカウント削除ボタン
class AccountSettingQuitTile extends ConsumerWidget {
  const AccountSettingQuitTile();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(MdiIcons.accountOff),
      title: const Text('アカウントの削除'),
      onTap: () => ref
          .read(accountSettingPageControllerProvider.notifier)
          .deleteAccount(context),
    );
  }
}
