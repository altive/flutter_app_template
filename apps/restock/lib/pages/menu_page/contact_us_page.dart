import 'package:flutter/material.dart';

/// お問い合わせページ
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  static String get routeName => '/contact-us';

  /// ナビゲーション
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true).push<void>(
      MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => const ContactUsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('お問い合わせ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('ご意見・ご要望をお送りください'),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: const Text('送信')),
          ],
        ),
      ),
    );
  }
}
