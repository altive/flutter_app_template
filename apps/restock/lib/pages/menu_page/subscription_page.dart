import 'package:flutter/material.dart';

/// 課金状況ページ
class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  static String get routeName => '/subscription';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const SubscriptionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('課金状況')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): サブスクリプション情報取得API呼び出し
            const Text('現在のプラン: (取得データ)'),
            const SizedBox(height: 8),
            const Text('次回更新日: (取得データ)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): プラン変更画面へ遷移
              },
              child: const Text('プランを変更'),
            ),
          ],
        ),
      ),
    );
  }
}
