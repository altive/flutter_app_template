import 'package:flutter/material.dart';

/// データ管理ページ
class DataManagementPage extends StatelessWidget {
  const DataManagementPage({super.key});

  static String get routeName => '/data-management';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const DataManagementPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('データ管理')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('バックアップ状況: (取得データ)'),
            const SizedBox(height: 8),
            const Text('エクスポート: (取得データ)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('バックアップ / エクスポート'),
            ),
          ],
        ),
      ),
    );
  }
}
