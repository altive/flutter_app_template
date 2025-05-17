import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../menu_page/menu_page.dart';
import '../stock_list_page/stock_list_page.dart';

/// ホーム画面: アプリのダッシュボード
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static String get routeName => '/';

  /// ナビゲーション
  static Future<void> show(BuildContext context) {
    return Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const HomePage(),
      ),
    );
  }

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
            const SectionTitleWidget('期限アラート'),
            AlertCardWidget(
              title: 'まもなく期限切れ',
              count: 5,
              color: Colors.orange,
              onTap: () {
                // ローリングストック詳細画面へ
              },
            ),
            const SizedBox(height: 8),
            AlertCardWidget(
              title: 'すでに期限切れ',
              count: 2,
              color: Colors.red,
              onTap: () {
                // ローリングストック詳細画面へ
              },
            ),

            // 期限が近い商品リスト
            const SizedBox(height: 16),
            const SectionTitleWidget('期限が近い商品'),
            const ExpiringItemsListWidget(),

            // 在庫アラート
            const SizedBox(height: 16),
            const SectionTitleWidget('在庫アラート'),
            AlertCardWidget(
              title: '在庫わずか',
              count: 3,
              color: Colors.blue,
              onTap: () async {
                await StockListPage.show(context);
              },
            ),

            // 備蓄状況サマリー
            const SizedBox(height: 16),
            const SectionTitleWidget('備蓄状況'),
            const StockSummaryWidget(),

            // お知らせ・Tips
            const SizedBox(height: 16),
            const SectionTitleWidget('お知らせ・Tips'),
            const NewsListWidget(),
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
}

/// お知らせ・Tipsリスト
class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                onTap: () async {
                  await MenuPage.show(context);
                },
              ),
            );
          }).toList(),
    );
  }
}

/// 期限が近い商品リスト
class ExpiringItemsListWidget extends StatelessWidget {
  const ExpiringItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}

/// 備蓄状況サマリー
class StockSummaryWidget extends StatelessWidget {
  const StockSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}

/// アラートカード
class AlertCardWidget extends StatelessWidget {
  const AlertCardWidget({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.onTap,
  });

  final String title;
  final int count;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
}

/// セクションタイトル
class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
