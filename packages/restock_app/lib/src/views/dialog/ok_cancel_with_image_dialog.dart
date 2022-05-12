import 'package:flutter/material.dart';

import '../../common_widgets/primary_button.dart';
import '../../common_widgets/secondary_button.dart';

class OkCancelWithImageDialog extends StatelessWidget {
  // Constructor
  const OkCancelWithImageDialog({
    required this.imageName,
    required this.titleLabel,
    required this.messageLabel,
    this.primaryButtonIconData,
    this.primaryButtonLabel = 'はい',
    required this.primaryButtonOnPressed,
    this.secondaryButtonIconData,
    this.secondaryButtonLabel = 'いいえ',
    required this.secondaryButtonOnPressed,
  });

  // Field
  static const String routeName = '/ask-app-feel';

  final String imageName;
  final String titleLabel;
  final String messageLabel;

  final IconData? primaryButtonIconData;
  final String primaryButtonLabel;
  final void Function() primaryButtonOnPressed;

  final IconData? secondaryButtonIconData;
  final String secondaryButtonLabel;
  final void Function() secondaryButtonOnPressed;

  // Methods
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      content: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: ListBody(
            children: <Widget>[
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  // ダークモードの表示のためにライトモードに合わせた背景色を設定
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(imageName),
              ),
              const SizedBox(height: 16),
              Text(
                titleLabel,
                style: theme.textTheme.subtitle1,
              ),
              const SizedBox(height: 8),
              Text(
                messageLabel,
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        SecondaryButton.icon(
          iconData: secondaryButtonIconData,
          labelText: secondaryButtonLabel,
          onPressed: secondaryButtonOnPressed,
        ),
        PrimaryButton(
          iconData: primaryButtonIconData,
          labelText: primaryButtonLabel,
          padding: const EdgeInsets.fromLTRB(8, 0, 16, 8),
          onPressed: primaryButtonOnPressed,
        ),
      ],
    );
  }
}
