import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'contact_us_page.dart';
import 'data_management_page.dart';
import 'group_list_page.dart';
import 'group_setting_page.dart';
import 'help_page.dart';
import 'location_category_page.dart';
import 'notification_setting_page.dart';
import 'profile_page.dart';
import 'subscription_page.dart';
import 'terms_page.dart';

/// メニュー画面: アカウント設定やアプリの各種ユーティリティ機能への入口。
class MenuPage extends HookConsumerWidget {
  const MenuPage({super.key});

  static String get routeName => '/menu';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const MenuPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('メニュー')),
      body: ListView(
        children: [
          // アカウントセクション
          _buildMenuSection(
            context: context,
            title: 'アカウント',
            iconColor: Colors.indigo,
            items: [
              _MenuItem(
                icon: Icons.person,
                label: 'プロフィール',
                description: 'ユーザー情報の確認・編集',
                onTap: () async {
                  await ProfilePage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.workspace_premium,
                label: '課金状況',
                description: 'サブスクリプションの確認・変更',
                onTap: () async {
                  await SubscriptionPage.show(context);
                },
              ),
            ],
          ),
          const Divider(height: 1),

          // グループセクション
          _buildMenuSection(
            context: context,
            title: 'グループ',
            iconColor: Colors.green,
            items: [
              _MenuItem(
                icon: Icons.groups,
                label: 'グループ一覧 / 招待',
                description: '参加中グループの確認・招待',
                onTap: () async {
                  await GroupListPage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.settings_suggest,
                label: 'グループ設定',
                description: '権限管理・グループ名変更',
                onTap: () async {
                  await GroupSettingPage.show(context);
                },
              ),
            ],
          ),
          const Divider(height: 1),

          // アプリ設定セクション
          _buildMenuSection(
            context: context,
            title: 'アプリ設定',
            iconColor: Colors.deepOrange,
            items: [
              _MenuItem(
                icon: Icons.notifications_active,
                label: '通知設定',
                description: '期限アラートなどの通知',
                onTap: () async {
                  await NotificationSettingPage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.place,
                label: '場所 / カテゴリ管理',
                description: '保管場所・カテゴリの追加・編集',
                onTap: () async {
                  await LocationCategoryPage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.backup,
                label: 'データ管理',
                description: 'バックアップ・エクスポート',
                onTap: () async {
                  await DataManagementPage.show(context);
                },
              ),
            ],
          ),
          const Divider(height: 1),

          // サポートセクション
          _buildMenuSection(
            context: context,
            title: 'サポート',
            iconColor: Colors.blueGrey,
            items: [
              _MenuItem(
                icon: Icons.help_outline,
                label: 'ヘルプ / FAQ',
                description: 'よくある質問',
                onTap: () async {
                  await HelpPage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.article_outlined,
                label: '利用規約・プライバシー',
                description: '利用規約の閲覧',
                onTap: () async {
                  await TermsPage.show(context);
                },
              ),
              _MenuItem(
                icon: Icons.contact_support_outlined,
                label: 'お問い合わせ',
                description: 'フィードバックを送信',
                onTap: () async {
                  await ContactUsPage.show(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection({
    required BuildContext context,
    required String title,
    required List<_MenuItem> items,
    Color? iconColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (final item in items)
          ListTile(
            leading: Icon(item.icon, color: iconColor ?? Colors.blue),
            title: Text(item.label),
            subtitle: Text(
              item.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: item.onTap,
          ),
      ],
    );
  }
}

class _MenuItem {
  const _MenuItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;
}
