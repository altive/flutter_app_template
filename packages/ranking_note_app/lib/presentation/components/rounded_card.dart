import 'package:flutter/material.dart';

/// 最初か最後が角丸になり、中間だったら四角くなるカード。
/// [isFirst] is index = 0.
/// [isLast] is list.length.
class RoundedCard extends StatelessWidget {
  const RoundedCard({
    this.isFirst = true,
    this.isLast = true,
    this.radius = const Radius.circular(16),
    this.padding = EdgeInsets.zero,
    this.elevation = 0,
    this.color,
    required this.child,
    Key? key,
  }) : super(key: key);

  final bool isFirst;
  final bool isLast;
  final Radius radius;
  final EdgeInsetsGeometry padding;
  final double elevation;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );

    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation,
      shape: shape,
      clipBehavior: isFirst || isLast ? Clip.antiAlias : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: Border(
            bottom: isLast
                ? BorderSide.none
                : BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
