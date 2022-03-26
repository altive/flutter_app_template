import 'package:flutter/material.dart';

class NewLabel extends StatelessWidget {
  const NewLabel(
    this.label, {
    Key? key,
    this.color,
  }) : super(key: key);

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 8,
      right: 16,
      child: Text(
        label,
        style: theme.textTheme.caption!.copyWith(
          color: color ?? theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
