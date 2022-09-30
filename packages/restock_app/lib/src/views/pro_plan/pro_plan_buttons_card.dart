import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/revenue/revenue.dart';
import 'pro_plan_page_controller.dart';

class ProPlanButtonsCard extends HookConsumerWidget {
  const ProPlanButtonsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isProPlanUser = ref.watch(
      revenueControllerProvider.select<bool>((value) => value.isSubscriber),
    );
    final pageState = ref.watch(proPlanPageControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          isProPlanUser ? 'あなたはProユーザーです🎉' : 'Proプランを購入する',
          textAlign: TextAlign.center,
          style: theme.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        if (pageState.monthlyProPlanInformation != null) ...[
          const Gap(8),
          ElevatedButton(
            onPressed:
                // すでにProプランの場合はボタン非活性
                isProPlanUser ? null : () => _purchaseMonthly(ref, context),
            child: Text('${pageState.monthlyProPlanInformation!.price} / 月'),
          ),
        ],
        if (pageState.annualProPlanInformation != null) ...[
          const Gap(8),
          ElevatedButton(
            onPressed:
                // すでにProプランの場合はボタン非活性
                isProPlanUser ? null : () => _purchaseAnnual(ref, context),
            child: Text('${pageState.annualProPlanInformation!.price} / 年'),
          ),
        ],
        const SizedBox(height: 16),
        Text(
          '購入済の方はこちら',
          textAlign: TextAlign.center,
          style: theme.textTheme.caption,
        ),
        OutlinedButton(
          child: const Text('購入情報を復元'),
          onPressed: () => _restore(ref, context),
        ),
      ],
    );
  }

  // 月額プランの購入ボタンが押された時
  Future<void> _purchaseMonthly(WidgetRef ref, BuildContext context) async {
    return ref
        .read(proPlanPageControllerProvider.notifier)
        .purchaseMonthlyProPlan(context);
  }

  // 年額プランの購入ボタンが押された時
  Future<void> _purchaseAnnual(WidgetRef ref, BuildContext context) async {
    return ref
        .read(proPlanPageControllerProvider.notifier)
        .purchaseAnnualProPlan(context);
  }

  // 購入の復元ボタンが押された時
  Future<void> _restore(WidgetRef ref, BuildContext context) async {
    return ref
        .read(proPlanPageControllerProvider.notifier)
        .restorePurchase(context);
  }
}
