import 'package:flutter/material.dart';

/// グループ設定ページ
class GroupSettingPage extends StatelessWidget {
  const GroupSettingPage({super.key});

  static String get routeName => '/group-setting';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const GroupSettingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('グループ設定')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): グループ情報取得API呼び出し
            const Text('グループ名: (取得データ)'),
            const SizedBox(height: 8),
            const Text('権限管理: (取得データ)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): グループ名変更・権限管理画面へ遷移
              },
              child: const Text('編集'),
            ),
          ],
        ),
      ),
    );
  }
}
