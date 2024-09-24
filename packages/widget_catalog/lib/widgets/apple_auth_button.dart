import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: AppleAuthButton,
  path: '[Interactions]/buttons',
)
Widget appleAuthButton(BuildContext context) {
  return AppleAuthButton(
    onPressed: () {},
    labelText: context.knobs.string(
      label: 'Button label',
      description: 'The text displayed on the button',
      initialValue: 'Sign in with Apple',
    ),
  );
}
