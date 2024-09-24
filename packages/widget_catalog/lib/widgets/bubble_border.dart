import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(name: 'Left', type: ShapeDecoration)
Widget leftBubbleBorder(BuildContext context) {
  return Container(
    width: 100,
    height: 100,
    decoration: ShapeDecoration(
      shape: const BubbleBorder(),
      color: Theme.of(context).colorScheme.surface,
    ),
  );
}

@UseCase(name: 'Right', type: ShapeDecoration)
Widget rightBubbleBorder(BuildContext context) {
  return Container(
    width: 100,
    height: 100,
    decoration: ShapeDecoration(
      shape: const BubbleBorder(destination: Destination.right),
      color: Theme.of(context).colorScheme.surface,
    ),
  );
}
