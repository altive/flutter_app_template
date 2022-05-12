import 'package:flutter/material.dart';

class ResultCell extends StatelessWidget {
  const ResultCell({
    required this.rice,
    required this.water,
  });

  final double rice;
  final int water;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (rice == 0 || water == 0) {
      return const ListTile(
        title: Text(
          '3日分の無洗米と飲料水を計算できます',
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      );
    }
    final strongStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
      fontSize: 24,
    );
    final weakStyle = theme.textTheme.caption;
    return ListTile(
      title: Text.rich(
        TextSpan(
          text: '無洗米',
          style: weakStyle,
          children: [
            TextSpan(
              text: rice.toStringAsFixed(1),
              style: strongStyle,
            ),
            const TextSpan(
              text: '㎏と',
            ),
            const TextSpan(
              text: ' 飲料水',
            ),
            TextSpan(
              text: '$water',
              style: strongStyle,
            ),
            const TextSpan(
              text: 'ℓがストックの目安です',
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
