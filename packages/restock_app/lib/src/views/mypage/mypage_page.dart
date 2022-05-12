import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_widgets/list_cell.dart';
import '../../core/revenue/revenue.dart';
import '../../providers/package_info.dart';
import '../../util/theme/ex_theme.dart';
import '../../util/theme/theme_controller.dart';
import '../../utils/utils.dart';
import '../about_this_app/about_this_app.dart';
import '../account_setting/account_setting_page.dart';
import '../favorites_list/favorites_list_page.dart';
import '../notification_setting/notification_setting_page.dart';
import '../place_editor/place_editor_page.dart';
import '../pro_plan/pro_plan_page.dart';
import '../theme_selection/theme_selection_page.dart';

class MypagePage extends HookConsumerWidget {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  const MypagePage();

  // ----------------------------------------
  // Field
  // ----------------------------------------
  static const String routeName = '/mypage';

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final isSubscriber = ref
        .watch(revenueControllerProvider.select<bool>((s) => s.isSubscriber));
    return Scaffold(
      appBar: AppBar(
        title: const Text('マイページ'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListCell(
              leading: const Icon(MdiIcons.diamondStone),
              title: Text(isSubscriber ? 'あなたはProユーザーです🎉' : 'Proプランの特典と価格'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () =>
                  Navigator.of(context).pushNamed(ProPlanPage.routeName),
            ),
            if (ref.watch(flavorProvider) != Flavor.production)
              ListCell(
                leading: null,
                title: const Text('アプリ内課金デバッグ画面'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context)
                    .pushNamed(PurchaseDebugPage.routeName),
              ),
            ListCell(
              leading: const Icon(Icons.account_circle),
              title: const Text('アカウント設定'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AccountSettingPage.routeName,
                );
              },
            ),
            const _ThemeSelectionTile(),
            ListCell(
              leading: const Icon(Icons.favorite),
              title: const Text('お気に入り'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(
                  FavoritesListPage.routeName,
                );
              },
            ),
            ListCell(
              leading: const Icon(Icons.category),
              title: const Text('ストックのグループ設定'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(
                  PlaceEditorPage.routeName,
                );
              },
            ),
            const _NotificationSettingTile(),
            ListCell(
              leading: const Icon(Icons.app_settings_alt),
              title: const Text('このアプリについて'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AboutThisAppPage.routeName,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'ver.${packageInfo.version}(${packageInfo.buildNumber})',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// テーマ設定画面へ遷移するためのListTile
/// 現在選択中のテーマ名を表示する
class _ThemeSelectionTile extends HookConsumerWidget {
  const _ThemeSelectionTile();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeColorProvider);
    return Ink(
      color: Theme.of(context).backgroundColor,
      child: ListTile(
        leading: Icon(currentTheme.icon),
        title: const Text('テーマカラー'),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            FittedBox(child: Text(currentTheme.name!)),
            const FittedBox(child: Icon(Icons.chevron_right)),
          ],
        ),
        onTap: () =>
            Navigator.of(context).pushNamed(ThemeSelectionPage.routeName),
      ),
    );
  }
}

/// 通知設定画面へ遷移するためのListTile
class _NotificationSettingTile extends StatelessWidget {
  const _NotificationSettingTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Ink(
      color: theme.backgroundColor,
      child: ListTile(
        leading: const Icon(Icons.notifications_active),
        title: const Text('期限の通知'),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            FittedBox(child: Icon(Icons.chevron_right)),
          ],
        ),
        onTap: () =>
            Navigator.of(context).pushNamed(NotificationSettingPage.routeName),
      ),
    );
  }
}
