import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.onPressed,
    required this.labelText,
    this.minWidth = 44,
  }) : iconData = null;

  const SecondaryButton.icon({
    required this.onPressed,
    required this.iconData,
    required this.labelText,
    this.minWidth = 44,
  });

  final void Function() onPressed;
  final IconData? iconData;
  final String labelText;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = Text(
      labelText,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.subtitle2!.copyWith(
        letterSpacing: 2,
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
    final style = OutlinedButton.styleFrom(
      side: BorderSide(color: theme.colorScheme.primary),
      shape: const StadiumBorder(),
      minimumSize: Size(minWidth, 44),
    );
    return iconData == null
        ? OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: text,
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            style: style,
            icon: Icon(iconData, color: theme.colorScheme.primary),
            label: text,
          );
  }
}
