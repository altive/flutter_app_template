import 'package:flutter/material.dart';

/// Widget of items that can be deleted with a swipe.
class DismissibleBackground extends StatelessWidget {
  /// Creates a new instance of [DismissibleBackground].
  const DismissibleBackground({
    super.key,
    required this.child,
    this.backgroundColor,
    this.margin = EdgeInsets.zero,
    this.alignment = Alignment.centerRight,
    this.borderRadius = BorderRadius.zero,
  });

  /// Widget to display.
  final Widget child;

  /// Background color.
  final Color? backgroundColor;

  /// Outer margins.
  final EdgeInsetsGeometry margin;

  /// Alignment of the child.
  final Alignment alignment;

  /// degree of roundness.
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.error,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
