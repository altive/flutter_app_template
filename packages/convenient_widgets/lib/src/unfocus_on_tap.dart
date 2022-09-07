import 'package:flutter/material.dart';

class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Padding等でも反応させるために必要
      onTap: FocusScope.of(context).unfocus,
      child: child,
    );
  }
}
