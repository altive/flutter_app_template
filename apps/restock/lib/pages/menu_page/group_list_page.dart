import 'package:flutter/material.dart';

/// グループ一覧 / 招待ページ
class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  static String get routeName => '/group-list';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const GroupListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('グループ一覧 / 招待')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): 参加中グループ一覧取得API呼び出し
            const Text('グループA'),
            const Text('グループB'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): 招待機能実装
              },
              child: const Text('グループに招待'),
            ),
          ],
        ),
      ),
    );
  }
}
