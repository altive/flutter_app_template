import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/secondary_button.dart';
import 'pro_plan_buttons_card.dart';
import 'pro_plan_comparison_card.dart';
import 'pro_plan_notice_card.dart';
import 'pro_plan_page_controller.dart';
import 'pro_plan_top_card.dart';

class ProPlanPage extends HookConsumerWidget {
  // Constructor
  const ProPlanPage();

  // Field
  static const String routeName = '/pro-plan';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingIndicator(
      loading: ref.watch(
        proPlanPageControllerProvider.select<bool?>((s) => s.isLoading),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Proプラン')),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(bottom: 16),
            children: [
              const ProPlanTopCard(),
              const _Card(child: ProPlanComparisonCard()),
              const _Card(child: ProPlanButtonsCard()),
              if (Platform.isIOS || Platform.isMacOS)
                const _Card(child: ProPlanStoreLinkCard()),
              const _Card(child: ProPlanNoticeCard()),
            ],
          ),
        ),
      ),
    );
  }
}

/// 共通のカードデザイン
class _Card extends StatelessWidget {
  const _Card({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: child,
        ),
      ),
    );
  }
}

class ProPlanStoreLinkCard extends HookConsumerWidget {
  const ProPlanStoreLinkCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SecondaryButton.icon(
          iconData: Icons.launch,
          labelText: 'お支払い方法の管理',
          onPressed: () => ref
              .read(proPlanPageControllerProvider.notifier)
              .openBillingPage(),
        ),
        const SizedBox(height: 16),
        SecondaryButton.icon(
          iconData: Icons.launch,
          labelText: 'サブスクリプションの管理',
          onPressed: () => ref
              .read(proPlanPageControllerProvider.notifier)
              .openSubscriptionManagingPage(),
        ),
      ],
    );
  }
}
