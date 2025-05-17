import 'package:flutter/material.dart';

/// プロフィールページ
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static String get routeName => '/profile';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('プロフィール')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 40),
            const SizedBox(height: 16),
            // TODO(riscait): ユーザー情報取得API呼び出し
            const Text('ユーザー名: (取得データ)'),
            const SizedBox(height: 8),
            const Text('メールアドレス: (取得データ)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO(riscait): プロフィール編集画面へ遷移
              },
              child: const Text('編集'),
            ),
          ],
        ),
      ),
    );
  }
}
