import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';
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
        if (pageState.monthlyProPlanInformation != null)
          PrimaryButton.circular(
            labelText: '${pageState.monthlyProPlanInformation!.price} / 月',
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed:
                // すでにProプランの場合はボタン非活性
                isProPlanUser ? null : () => _purchaseMonthly(ref, context),
          ),
        if (pageState.annualProPlanInformation != null)
          PrimaryButton.circular(
            labelText: '${pageState.annualProPlanInformation!.price} / 年',
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed:
                // すでにProプランの場合はボタン非活性
                isProPlanUser ? null : () => _purchaseAnnual(ref, context),
          ),
        const SizedBox(height: 16),
        Text(
          '購入済の方はこちら',
          textAlign: TextAlign.center,
          style: theme.textTheme.caption,
        ),
        SecondaryButton(
          labelText: '購入情報を復元',
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
