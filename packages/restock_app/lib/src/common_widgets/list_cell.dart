import 'package:flutter/material.dart';

/// アプリ内で共通して使うListで表示するセル（行）のWidget
/// [leading], [title], [trailing]
class ListCell extends StatelessWidget {
  const ListCell({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  final Widget? leading;
  final Widget title;
  final Widget trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Theme.of(context).backgroundColor,
      child: ListTile(
        leading: leading,
        title: title,
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
