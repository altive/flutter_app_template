import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class LogCardContextMenuItem {
  LogCardContextMenuItem.delete({required this.onTap})
      : title = 'Delete',
        isDefault = false,
        isDestructive = true,
        trailingIconData = Icons.delete;

  LogCardContextMenuItem.duplicate({required this.onTap})
      : title = 'Duplicate',
        isDefault = false,
        isDestructive = false,
        trailingIconData = Icons.copy;

  LogCardContextMenuItem.edit({required this.onTap})
      : title = 'Edit',
        isDefault = true,
        isDestructive = false,
        trailingIconData = Icons.edit;

  final String title;
  final VoidCallback onTap;

  /// used only in CupertinoContextMenuAction.
  final bool isDefault;
  final bool isDestructive;
  final IconData trailingIconData;

  PullDownMenuItem get pullDownMenuItem => PullDownMenuItem(
        onTap: onTap,
        isDestructive: isDestructive,
        icon: trailingIconData,
        title: title,
      );

  CupertinoContextMenuAction get cupertinoContextMenuAction =>
      CupertinoContextMenuAction(
        onPressed: onTap,
        isDefaultAction: isDefault,
        isDestructiveAction: isDestructive,
        trailingIcon: trailingIconData,
        child: Text(title),
      );
}
