import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_down_button/pull_down_button.dart';

import 'log_card_context_menu_item.dart';
import 'onetaplog.dart';

final logProvider = Provider<OTLog>((_) => throw UnimplementedError());

class LogCard extends ConsumerWidget {
  const LogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    const borderRadius = BorderRadius.all(Radius.circular(16));
    final log = ref.watch(logProvider);

    final editMenuItem = LogCardContextMenuItem.edit(onTap: () {});
    final duplicateMenuItem = LogCardContextMenuItem.duplicate(onTap: () {});
    final deleteMenuItem = LogCardContextMenuItem.delete(onTap: () {});
    return CupertinoContextMenu(
      actions: [
        editMenuItem.cupertinoContextMenuAction,
        duplicateMenuItem.cupertinoContextMenuAction,
        deleteMenuItem.cupertinoContextMenuAction,
      ],
      child: GestureDetector(
        onTap: () {
          debugPrint('GestureDetector');
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.background.withOpacity(0.25),
                colorScheme.background.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      log.iconData,
                      size: 32,
                    ),
                    PullDownButton(
                      position: PullDownMenuPosition.under,
                      itemBuilder: (context) {
                        return [
                          editMenuItem.pullDownMenuItem,
                          duplicateMenuItem.pullDownMenuItem,
                          deleteMenuItem.pullDownMenuItem,
                        ];
                      },
                      buttonBuilder: (
                        BuildContext context,
                        Future<void> Function() showMenu,
                      ) {
                        return IconButton(
                          onPressed: showMenu,
                          padding: EdgeInsets.zero,
                          icon: const Icon(CupertinoIcons.ellipsis_circle),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  log.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  log.lastUpdatedText,
                  style: Theme.of(context).textTheme.caption!.copyWith(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
