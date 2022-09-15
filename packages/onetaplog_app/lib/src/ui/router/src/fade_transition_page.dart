import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Fade-in, Fade-outで表示する、[CustomTransitionPage]を返す。
CustomTransitionPage<void> fadeTransitionPage({
  LocalKey? key,
  bool fullscreenDialog = false,
  bool opaque = false,
  bool barrierDismissible = false,
  Duration transitionDuration = const Duration(milliseconds: 300),
  required Widget child,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    fullscreenDialog: fullscreenDialog,
    opaque: opaque,
    barrierDismissible: barrierDismissible,
    transitionDuration: transitionDuration,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
