import 'dart:ui';

import 'package:flutter/material.dart';

import 'pro_plan_benefit.dart';

class ProPlanComparisonCard extends StatelessWidget {
  const ProPlanComparisonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(width: 8);
    return Column(
      children: [
        Text(
          '無料プラン・Proプランの比較',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontFamily: 'M_PLUS_Rounded_1c',
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 項目タイトル
            Column(
              // 左右寄せ
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _NormalCell(label: ' '),
                ...ProPlanBenefit.values
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: _HeadCell(label: e.title),
                      ),
                    )
                    .toList(),
              ],
            ),
            const SizedBox(width: 16),
            // for Free
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  const _NormalCell(label: '無料'),
                  ...ProPlanBenefit.values
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: _NormalCell(label: e.forFree),
                          ))
                      .toList(),
                ],
              ),
            ),
            spacer,
            // for Premium
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                const _PremiumCell(label: 'Pro'),
                ...ProPlanBenefit.values
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: _PremiumCell(label: e.forPremium),
                        ))
                    .toList(),
              ]),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeadCell extends StatelessWidget {
  const _HeadCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 32,
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

class _NormalCell extends StatelessWidget {
  const _NormalCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 32,
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}

class _PremiumCell extends StatelessWidget {
  const _PremiumCell({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 32,
      ),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
