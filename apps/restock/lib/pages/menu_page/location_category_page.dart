import 'package:flutter/material.dart';

/// 場所 / カテゴリ管理ページ
class LocationCategoryPage extends StatelessWidget {
  const LocationCategoryPage({super.key});

  static String get routeName => '/location-category';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const LocationCategoryPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('場所 / カテゴリ管理')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): 場所・カテゴリ一覧取得API呼び出し
            const Text('場所A'),
            const Text('カテゴリX'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): 場所・カテゴリ追加/編集画面へ遷移
              },
              child: const Text('追加・編集'),
            ),
          ],
        ),
      ),
    );
  }
}
