import 'package:flutter/material.dart';

/// 通知設定ページ
class NotificationSettingPage extends StatelessWidget {
  const NotificationSettingPage({super.key});

  static String get routeName => '/notification-setting';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const NotificationSettingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('通知設定')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): 通知設定情報取得API呼び出し
            const Text('期限アラート: (取得データ)'),
            const SizedBox(height: 8),
            const Text('プッシュ通知: (取得データ)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): 通知設定編集画面へ遷移
              },
              child: const Text('編集'),
            ),
          ],
        ),
      ),
    );
  }
}
