import 'package:flutter/material.dart';

/// 送信ボタン
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.iconData,
    required this.labelText,
    required this.onPressed,
    this.padding = const EdgeInsets.all(16),
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
  });

  const PrimaryButton.circular({
    this.iconData,
    required this.labelText,
    required this.onPressed,
    this.padding = const EdgeInsets.all(16),
    this.shape = const StadiumBorder(),
    this.backgroundColor,
    this.foregroundColor,
  });

  final IconData? iconData;
  final String labelText;
  final void Function()? onPressed;
  final EdgeInsets padding;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = Text(
      labelText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.subtitle2!.copyWith(
        letterSpacing: 2,
        color: foregroundColor ?? theme.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
    return Padding(
      padding: padding,
      child: iconData == null
          ? ElevatedButton(
              onPressed: onPressed,
              child: title,
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(iconData, color: theme.colorScheme.onPrimary),
              label: title,
            ),
    );
  }
}
