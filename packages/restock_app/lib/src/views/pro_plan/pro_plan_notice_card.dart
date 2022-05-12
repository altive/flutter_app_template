import 'package:flutter/material.dart';

import 'pro_plan_notice.dart';

class ProPlanNoticeCard extends StatelessWidget {
  const ProPlanNoticeCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '注意事項',
            textAlign: TextAlign.center,
            style: theme.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          ...PurchaseNotice.values.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  '○${e.titleLabel}',
                  style: theme.textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  e.textLabel,
                  style: theme.textTheme.bodyText2,
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
