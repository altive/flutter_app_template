import 'package:flutter/material.dart';

/// Destination of the balloon.
enum Destination {
  /// Facing left.
  left,

  /// Facing top.
  top,

  /// Facing right.
  right,

  /// Facing bottom.
  bottom,
}

/// BubbleBorder is Available in the `shape` parameter of [ShapeDecoration].
class BubbleBorder extends ShapeBorder {
  /// Creates a new instance of [BubbleBorder].
  const BubbleBorder({
    this.destination = Destination.left,
    this.usePadding = true,
  });

  /// Destination of the balloon.
  final Destination destination;

  /// Whether to use padding.
  final bool usePadding;

  Offset get _offset => () {
    switch (destination) {
      case Destination.left:
        return const Offset(-12, 0);
      case Destination.right:
        return const Offset(12, 0);
      case Destination.top:
        return const Offset(0, -12);
      case Destination.bottom:
        return const Offset(0, 12);
    }
  }();

  @override
  EdgeInsetsGeometry get dimensions => () {
    switch (destination) {
      case Destination.left:
        return EdgeInsets.only(left: usePadding ? 12 : 0);
      case Destination.right:
        return EdgeInsets.only(right: usePadding ? 12 : 0);
      case Destination.top:
        return EdgeInsets.only(top: usePadding ? 12 : 0);
      case Destination.bottom:
        return EdgeInsets.only(bottom: usePadding ? 12 : 0);
    }
  }();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r = Rect.fromPoints(rect.topRight, rect.bottomLeft - _offset);
    final path = Path();
    switch (destination) {
      case Destination.left:
        path
          ..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(8)))
          // 始点の調整
          ..moveTo(r.centerLeft.dx, r.centerLeft.dy - 12)
          // 左下へ直線を描く
          ..relativeLineTo(-12, 12)
          // 右下へ直線を描く
          ..relativeLineTo(12, 12);
      case Destination.right:
        path
          ..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(8)))
          // 始点の調整
          ..moveTo(r.centerRight.dx, r.centerRight.dy - 12)
          // 右下へ直線を描く
          ..relativeLineTo(12, 12)
          // 左下へ直線を描く
          ..relativeLineTo(-12, 12);
      case Destination.top:
        path
          ..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(8)))
          // 始点の調整
          ..moveTo(r.topCenter.dx - 12, r.topCenter.dy)
          // 右上へ直線を描く
          ..relativeLineTo(12, -12)
          // 右下へ直線を描く
          ..relativeLineTo(12, 12);
      case Destination.bottom:
        path
          ..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(8)))
          // 始点の調整
          ..moveTo(r.bottomCenter.dx + 12, r.bottomCenter.dy)
          // 左下へ直線を描く
          ..relativeLineTo(-12, 12)
          // 左上へ直線を描く
          ..relativeLineTo(-12, -12);
    }
    // 始点まで線を繋げて閉じる
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
