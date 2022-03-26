import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AmazonIcon extends StatelessWidget {
  const AmazonIcon({
    Key? key,
    this.alignment = Alignment.center,
  }) : super(key: key);

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
          child: const Icon(MdiIcons.amazon),
        ),
      ),
    );
  }
}
