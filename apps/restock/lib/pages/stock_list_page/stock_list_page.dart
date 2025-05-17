import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../add_item_page/add_item_page.dart';

/// 備蓄リスト画面: 登録されている全備蓄品の確認と管理
class StockListPage extends HookConsumerWidget {
  const StockListPage({super.key});

  static String get routeName => '/stock-list';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const StockListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // フィルターや並び替えの状態（実際はProviderで管理）
    const selectedFilter = '全て';
    const selectedSort = '期限が近い順';

    return Scaffold(
      appBar: AppBar(
        title: const Text('備蓄リスト'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // 検索機能
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // フィルターと並び替え
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // フィルターダイアログを表示
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.filter_list, size: 18),
                          SizedBox(width: 4),
                          Text(
                            '絞り込み: $selectedFilter',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      // 並び替えダイアログを表示
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.sort, size: 18),
                          SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              '並び替え: $selectedSort',
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // リスト表示
          Expanded(child: _buildStockList()),
        ],
      ),
    );
  }

  Widget _buildStockList() {
    // 仮のアイテムデータ
    final items = [
      {
        'name': 'カップラーメン（醤油）',
        'category': '食品',
        'expiry': '2024-06-15',
        'location': 'パントリー',
        'quantity': 5,
        'image': 'food',
        'daysLeft': 10,
      },
      {
        'name': '水（2L）',
        'category': '飲料',
        'expiry': '2025-01-20',
        'location': '倉庫',
        'quantity': 12,
        'image': 'water',
        'daysLeft': 230,
      },
      {
        'name': '乾電池（単三）',
        'category': '生活用品',
        'expiry': '2026-05-10',
        'location': '引き出し',
        'quantity': 8,
        'image': 'battery',
        'daysLeft': 700,
      },
      {
        'name': '缶詰（ツナ）',
        'category': '食品',
        'expiry': '2024-06-05',
        'location': '食品棚',
        'quantity': 3,
        'image': 'food',
        'daysLeft': 0,
      },
      {
        'name': 'トイレットペーパー',
        'category': '生活用品',
        'expiry': '使用期限なし',
        'location': 'トイレ脇',
        'quantity': 24,
        'image': 'paper',
        'daysLeft': 9999,
      },
      {
        'name': 'レトルトカレー',
        'category': '食品',
        'expiry': '2024-08-20',
        'location': 'キッチン',
        'quantity': 6,
        'image': 'food',
        'daysLeft': 75,
      },
      {
        'name': '救急セット',
        'category': '医薬品',
        'expiry': '2025-03-15',
        'location': '洗面所',
        'quantity': 1,
        'image': 'medicine',
        'daysLeft': 280,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final daysLeft = item['daysLeft']! as int;

        // 期限に応じた色を設定
        final Color statusColor;
        if (daysLeft <= 0) {
          statusColor = Colors.red;
        } else if (daysLeft <= 7) {
          statusColor = Colors.orange;
        } else if (daysLeft <= 30) {
          statusColor = Colors.amber;
        } else {
          statusColor = Colors.green;
        }

        // アイコンの設定
        final IconData categoryIcon;
        final category = item['category']! as String;
        switch (category) {
          case '食品':
            categoryIcon = Icons.restaurant;
          case '飲料':
            categoryIcon = Icons.local_drink;
          case '生活用品':
            categoryIcon = Icons.home;
          case '医薬品':
            categoryIcon = Icons.medical_services;
          default:
            categoryIcon = Icons.inventory_2;
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () async {
              await AddItemPage.show(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // アイテムアイコン
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(categoryIcon, color: Colors.grey.shade700),
                  ),
                  const SizedBox(width: 16),
                  // アイテム情報
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name']! as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              item['location']! as String,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.category_outlined,
                              size: 14,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 数量・期限を縦並びで表示
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${item['quantity']}個',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          daysLeft <= 0
                              ? '期限切れ'
                              : daysLeft == 9999
                              ? '期限なし'
                              : '残り$daysLeft日',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: statusColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
