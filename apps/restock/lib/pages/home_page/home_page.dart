import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ホーム画面: アプリのダッシュボード
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 期限アラート (最重要)
            _buildSectionTitle('期限アラート'),
            _buildAlertCard(
              title: 'まもなく期限切れ',
              count: 5,
              color: Colors.orange,
              onTap: () {
                // ローリングストック詳細画面へ
              },
            ),
            const SizedBox(height: 8),
            _buildAlertCard(
              title: 'すでに期限切れ',
              count: 2,
              color: Colors.red,
              onTap: () {
                // ローリングストック詳細画面へ
              },
            ),

            // 期限が近い商品リスト
            const SizedBox(height: 16),
            _buildSectionTitle('期限が近い商品'),
            _buildExpiringItemsList(),

            // 在庫アラート
            const SizedBox(height: 16),
            _buildSectionTitle('在庫アラート'),
            _buildAlertCard(
              title: '在庫わずか',
              count: 3,
              color: Colors.blue,
              onTap: () {
                // 買い物リスト / 備蓄リストへ
              },
            ),

            // 備蓄状況サマリー
            const SizedBox(height: 16),
            _buildSectionTitle('備蓄状況'),
            _buildStockSummary(),

            // お知らせ・Tips
            const SizedBox(height: 16),
            _buildSectionTitle('お知らせ・Tips'),
            _buildNewsList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // バーコード読み取り機能へ
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAlertCard({
    required String title,
    required int count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, size: 28, color: color),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '$count件',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpiringItemsList() {
    // 仮のデータ
    final items = [
      {'name': 'カップラーメン', 'expiry': '2日後', 'location': 'パントリー'},
      {'name': '缶詰（ツナ）', 'expiry': '5日後', 'location': '食品棚'},
      {'name': 'レトルトカレー', 'expiry': '1週間後', 'location': 'キッチン'},
    ];

    return Column(
      children:
          items.map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.food_bank, color: Colors.white),
                ),
                title: Text(item['name']!),
                subtitle: Text(
                  '期限: ${item['expiry']} / 場所: ${item['location']}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // 詳細メニューを表示
                  },
                ),
                onTap: () {
                  // 詳細画面へ
                },
              ),
            );
          }).toList(),
    );
  }

  Widget _buildStockSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '目標達成度',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '75%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green.shade700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.75,
              backgroundColor: Colors.grey.shade200,
              color: Colors.green.shade500,
              minHeight: 10,
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // 備蓄計画画面へ
              },
              child: const Text('備蓄計画を見る'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList() {
    // 仮のお知らせデータ
    final news = [
      {'title': '台風シーズンの備えについて', 'date': '2024-06-01'},
      {'title': '新機能のお知らせ：グループ共有', 'date': '2024-05-22'},
      {'title': '食料備蓄のコツ', 'date': '2024-05-15'},
    ];

    return Column(
      children:
          news.map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text(item['title']!),
                subtitle: Text('公開日: ${item['date']}'),
                onTap: () {
                  // お知らせ詳細画面へ
                },
              ),
            );
          }).toList(),
    );
  }
}
