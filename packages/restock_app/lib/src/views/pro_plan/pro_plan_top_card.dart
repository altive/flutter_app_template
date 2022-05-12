import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/revenue/revenue.dart';

class ProPlanTopCard extends HookConsumerWidget {
  const ProPlanTopCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isProPlanUser = ref.watch(
      revenueControllerProvider.select<bool>((value) => value.isSubscriber),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
      color: theme.colorScheme.primary,
      child: Column(
        children: isProPlanUser
            ? [
                Text(
                  'リストック Pro',
                  style: theme.textTheme.headline6!.copyWith(
                    fontFamily: 'M_PLUS_Rounded_1c',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Proプランありがとうございます🎉',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline4!.copyWith(
                    fontFamily: 'M_PLUS_Rounded_1c',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            : [
                Text(
                  'リストック Pro',
                  style: theme.textTheme.headline6!.copyWith(
                    fontFamily: 'M_PLUS_Rounded_1c',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '30日間無料\nトライアル',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline4!.copyWith(
                    fontFamily: 'M_PLUS_Rounded_1c',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
      ),
    );
  }
}
