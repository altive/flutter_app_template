import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AmazonIcon extends StatelessWidget {
  const AmazonIcon({
    this.alignment = Alignment.center,
  });

  /// 表示位置揃え
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Hero(
      tag: 'AmazonIcon',
      child: Align(
        alignment: alignment,
        child: CircleAvatar(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.backgroundColor,
          child: const FaIcon(FontAwesomeIcons.amazon),
        ),
      ),
    );
  }
}
