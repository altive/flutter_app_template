import 'package:flutter/material.dart';

/// スワイプで削除できるアイテムのWidget
class DeletableBackground extends StatelessWidget {
  // Constructor
  const DeletableBackground({
    super.key,
    this.label = 'Delete',
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.centerLeft,
    this.borderRadius,
  });

  /// 表示する文字列。デフォルトは `Delete`
  final String label;
  final EdgeInsetsGeometry margin;
  final Alignment alignment;
  // どの角にどのくらいの角丸を施すか。デフォルトは全ての角に8の角丸
  final BorderRadius? borderRadius;

  // Methods
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      alignment: alignment,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyText1!.copyWith(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
