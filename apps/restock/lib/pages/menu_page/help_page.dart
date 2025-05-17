import 'package:flutter/material.dart';

/// ヘルプ / FAQページ
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  static String get routeName => '/help';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const HelpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ヘルプ / FAQ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): FAQデータ取得API呼び出し
            const Text('Q. 使い方は？'),
            const Text('A. ...'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): フィードバック送信画面へ遷移
              },
              child: const Text('フィードバックを送信'),
            ),
          ],
        ),
      ),
    );
  }
}
