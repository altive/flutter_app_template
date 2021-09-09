import 'package:flutter/material.dart';

/// スワイプで削除できるアイテムのWidget
class DismissibleBackground extends StatelessWidget {
  // Constructor
  const DismissibleBackground({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.red,
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.centerRight,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  /// 表示する文字列。デフォルトは `Delete`
  final Widget child;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final Alignment alignment;
  // どの角にどのくらいの角丸を施すか
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
