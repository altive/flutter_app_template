import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsCard extends ConsumerWidget {
  const SettingsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.background.withOpacity(0.25),
            colorScheme.background.withOpacity(0.5),
          ],
        ),
      ),
      child: const ListTile(
        dense: true,
        title: Text.rich(
          TextSpan(
            text: 'あなたが',
            children: [
              WidgetSpan(child: SizedBox(width: 4)),
              TextSpan(
                text: '猫水取り替え',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              WidgetSpan(child: SizedBox(width: 4)),
              TextSpan(text: 'を実行しました！'),
            ],
          ),
        ),
        subtitle: Text('2022年10月6日 12時50分', textAlign: TextAlign.end),
      ),
    );
  }
}
