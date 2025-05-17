import 'package:flutter/material.dart';

/// 利用規約・プライバシーページ
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  static String get routeName => '/terms';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const TermsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('利用規約・プライバシー')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO(riscait): 利用規約・プライバシーポリシー取得API呼び出し
            Text('利用規約（取得データ）'),
            SizedBox(height: 16),
            Text('プライバシーポリシー（取得データ）'),
          ],
        ),
      ),
    );
  }
}
