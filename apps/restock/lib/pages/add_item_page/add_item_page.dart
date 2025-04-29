import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 追加画面: 新しい備蓄品を登録する機能への入口
class AddItemPage extends HookConsumerWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('アイテム追加')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // バーコード読み取りボタン
            _buildActionButton(
              icon: Icons.qr_code_scanner,
              label: 'バーコードをスキャン',
              color: Colors.blue,
              onTap: () {
                // バーコードスキャン画面へ
              },
            ),

            const SizedBox(height: 16),

            // 手動入力ボタン
            _buildActionButton(
              icon: Icons.edit,
              label: '手動で入力する',
              color: Colors.green,
              onTap: () {
                // 手動入力画面へ
              },
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),

            // 最近追加したアイテム
            const Text(
              '最近追加したアイテム',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Expanded(child: _buildRecentItemsList()),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.2),
                radius: 24,
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      icon == Icons.qr_code_scanner
                          ? 'バーコードを読み取って素早く登録'
                          : 'バーコードがない商品も登録可能',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentItemsList() {
    // 仮のデータ
    final recentItems = [
      {'name': 'カップラーメン（醤油）', 'category': '食品', 'addedAt': '2024-06-01 10:30'},
      {'name': '乾電池（単三）', 'category': '生活用品', 'addedAt': '2024-05-28 15:45'},
      {'name': '水（2L）', 'category': '飲料', 'addedAt': '2024-05-25 08:15'},
      {'name': 'レトルトカレー', 'category': '食品', 'addedAt': '2024-05-20 12:30'},
      {'name': 'マスク', 'category': '医療品', 'addedAt': '2024-05-15 18:20'},
    ];

    // 履歴がない場合
    if (recentItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              'まだ履歴がありません',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // 履歴リスト
    return ListView.builder(
      itemCount: recentItems.length,
      itemBuilder: (context, index) {
        final item = recentItems[index];
        final name = item['name']!;
        final category = item['category']!;
        final addedAt = item['addedAt']!;

        // アイコンの設定
        final IconData categoryIcon;
        switch (category) {
          case '食品':
            categoryIcon = Icons.restaurant;
          case '飲料':
            categoryIcon = Icons.local_drink;
          case '生活用品':
            categoryIcon = Icons.home;
          case '医療品':
            categoryIcon = Icons.medical_services;
          default:
            categoryIcon = Icons.inventory_2;
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(categoryIcon, color: Colors.grey.shade700),
            ),
            title: Text(name),
            subtitle: Text('カテゴリ: $category'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '追加日時',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 2),
                Text(
                  addedAt,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
            onTap: () {
              // 再登録処理
            },
          ),
        );
      },
    );
  }
}
