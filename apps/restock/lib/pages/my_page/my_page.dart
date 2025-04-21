import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// マイページ画面: アプリ全体の設定やユーザー情報、付帯機能へのアクセス
class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: ListView(
        children: [
          // ユーザープロフィール部分
          _buildProfileSection(context),

          const SizedBox(height: 16),
          const Divider(height: 1),

          // 機能へのリンクセクション
          _buildMenuSection(
            title: '管理',
            items: [
              _MenuItem(
                icon: Icons.group,
                label: 'グループ管理',
                description: 'グループの作成・招待・設定',
                onTap: () {
                  // グループ管理画面へ
                },
              ),
              _MenuItem(
                icon: Icons.shopping_cart,
                label: '買い物リスト',
                description: '買い物予定の確認・管理',
                onTap: () {
                  // 買い物リスト画面へ
                },
              ),
              _MenuItem(
                icon: Icons.inventory_2,
                label: '備蓄計画',
                description: '家族構成設定・推奨リスト確認',
                onTap: () {
                  // 備蓄計画画面へ
                },
              ),
            ],
          ),

          const Divider(height: 1),

          // 設定セクション
          _buildMenuSection(
            title: '設定',
            items: [
              _MenuItem(
                icon: Icons.settings,
                label: 'アプリ設定',
                description: '通知・言語・テーマの設定',
                onTap: () {
                  // アプリ設定画面へ
                },
              ),
              _MenuItem(
                icon: Icons.category,
                label: 'カテゴリ/場所管理',
                description: '保管場所やカテゴリの追加・編集',
                onTap: () {
                  // カテゴリ/場所管理画面へ
                },
              ),
              _MenuItem(
                icon: Icons.backup,
                label: 'データ管理',
                description: 'バックアップ・復元・データ移行',
                onTap: () {
                  // データ管理画面へ
                },
              ),
            ],
          ),

          const Divider(height: 1),

          // サポート・情報セクション
          _buildMenuSection(
            title: 'サポート・情報',
            items: [
              _MenuItem(
                icon: Icons.help_outline,
                label: 'ヘルプ・よくある質問',
                description: '操作方法や疑問の解決',
                onTap: () {
                  // ヘルプ画面へ
                },
              ),
              _MenuItem(
                icon: Icons.info_outline,
                label: 'アプリについて',
                description: 'バージョン・利用規約・プライバシーポリシー',
                onTap: () {
                  // アプリ情報画面へ
                },
              ),
              _MenuItem(
                icon: Icons.star_outline,
                label: 'アプリを評価する',
                description: 'ストアでアプリの評価を行う',
                onTap: () {
                  // アプリ評価へ誘導
                },
              ),
            ],
          ),

          const SizedBox(height: 32),

          // ログアウトボタン
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {
                // ログアウト処理
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
              ),
              child: const Text('ログアウト'),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // プロフィール画像
          CircleAvatar(
            radius: 36,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(Icons.person, size: 40, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          // ユーザー情報
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ユーザー名',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'user@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildPlanBadge(isPremium: false),
                    const SizedBox(width: 8),
                    Text(
                      '登録日: 2024年1月1日',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 編集ボタン
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () {
              // プロフィール編集画面へ
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlanBadge({required bool isPremium}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isPremium ? Colors.amber.shade100 : Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isPremium ? 'プレミアム' : '無料プラン',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isPremium ? Colors.amber.shade800 : Colors.blue.shade800,
        ),
      ),
    );
  }

  Widget _buildMenuSection({
    required String title,
    required List<_MenuItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        for (final item in items)
          ListTile(
            leading: Icon(item.icon, color: Colors.blue.shade700),
            title: Text(item.label),
            subtitle: Text(
              item.description,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
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
