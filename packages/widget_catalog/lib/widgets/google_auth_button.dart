import 'package:convenient_widgets/convenient_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Default',
  type: GoogleAuthButton,
  path: '[Interactions]/buttons',
)
Widget googleAuthButton(BuildContext context) {
  return GoogleAuthButton(
    onPressed: () {},
    labelText: context.knobs.string(
      label: 'Button label',
      description: 'The text displayed on the button',
      initialValue: 'Sign in with Google',
    ),
  );
}
