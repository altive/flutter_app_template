import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import 'revenue_controller.dart';

/// アプリ内課金デバッグ画面
class PurchaseDebugPage extends HookWidget {
  // Constructor
  const PurchaseDebugPage();

  // Field
  static const String routeName = '/debug-purchase';

  // Methods
  @override
  Widget build(BuildContext context) {
    return LoadingIndicator(
      loading: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('アプリ内課金デバッグ画面')),
        body: const SafeArea(
          child: _ListView(),
        ),
      ),
    );
  }
}

class _ListView extends HookConsumerWidget {
  const _ListView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final revenueState = ref.watch(revenueControllerProvider);
    return ListView(
      children: [
        ListTile(
          title: const Text('サブスクリプション契約状態'),
          trailing: Text(
            revenueState.isSubscriber.toString(),
          ),
        ),
        ListTile(
          title: const Text('情報更新日時'),
          trailing: Text(
            revenueState.updatedDateString ?? 'なし',
          ),
        ),
        ListTile(
          title: const Text('購入日時'),
          trailing: Text(revenueState.isSubscriber.toString()),
        ),
        ListTile(
          title: const Text('有効期限'),
          trailing: Text(
            revenueState.latestExpirationDateString ?? 'なし',
          ),
        ),
      ],
    );
  }
}
