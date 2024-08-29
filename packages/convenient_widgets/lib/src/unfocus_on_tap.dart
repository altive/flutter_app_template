import 'package:flutter/material.dart';

/// Widget that allows you to unfocus by tapping the child.
class UnfocusOnTap extends StatelessWidget {
  /// Creates a new instance of [UnfocusOnTap].
  const UnfocusOnTap({
    super.key,
    required this.child,
  });

  /// Widget to be able to unfocus.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Necessary to react even with Padding, etc.
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: child,
    );
  }
}
