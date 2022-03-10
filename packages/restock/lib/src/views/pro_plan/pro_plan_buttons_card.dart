import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';
import '../../core/revenue/revenue.dart';
import 'pro_plan_page_controller.dart';

class ProPlanButtonsCard extends HookWidget {
  const ProPlanButtonsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isProPlanUser = useProvider(
        revenueControllerProvider.select((value) => value.isSubscriber));
    final pageState = useProvider(proPlanPageControllerProvider);
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
                isProPlanUser ? null : () => _purchaseMonthly(context),
          ),
        if (pageState.annualProPlanInformation != null)
          PrimaryButton.circular(
            labelText: '${pageState.annualProPlanInformation!.price} / 年',
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed:
                // すでにProプランの場合はボタン非活性
                isProPlanUser ? null : () => _purchaseAnnual(context),
          ),
        const SizedBox(height: 16),
        Text(
          '購入済の方はこちら',
          textAlign: TextAlign.center,
          style: theme.textTheme.caption,
        ),
        SecondaryButton(
          labelText: '購入情報を復元',
          onPressed: () => _restore(context),
        ),
      ],
    );
  }

  // 月額プランの購入ボタンが押された時
  Future<void> _purchaseMonthly(BuildContext context) async {
    return context
        .read(proPlanPageControllerProvider.notifier)
        .purchaseMonthlyProPlan(context);
  }

  // 年額プランの購入ボタンが押された時
  Future<void> _purchaseAnnual(BuildContext context) async {
    return context
        .read(proPlanPageControllerProvider.notifier)
        .purchaseAnnualProPlan(context);
  }

  // 購入の復元ボタンが押された時
  Future<void> _restore(BuildContext context) async {
    return context
        .read(proPlanPageControllerProvider.notifier)
        .restorePurchase(context);
  }
}
