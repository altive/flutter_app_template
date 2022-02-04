import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../commons/widgets/dismissible_background.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../ranking_detail_page/ranking_detail_page.dart';

/// 1つのランキングを表示するためのカード。
class RankingCard extends ConsumerWidget {
  const RankingCard(
    this.rankingDoc, {
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final QueryDocumentSnapshot<Ranking> rankingDoc;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDismissed(DismissDirection direction) {
      if (direction == DismissDirection.endToStart) {
        rankingDoc.reference.delete();
      }
    }

    Future<bool?> confirmDismiss(DismissDirection direction) async {
      if (direction == DismissDirection.endToStart) {
        debugPrint('Delete!!');
        return true;
      }
      if (direction == DismissDirection.startToEnd) {
        debugPrint('Pinned!!');
        final oldRanking = rankingDoc.data();
        final newRanking = oldRanking.copyWith(pinned: !oldRanking.pinned);
        // awaitを使うと、アニメーションとの兼ね合いでAssertionErrorが発生するため
        rankingDoc.reference.set(newRanking); // ignore: unawaited_futures
        return false;
      }
      return null;
    }

    const radius = Radius.circular(16);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );
    final ranking = rankingDoc.data();

    return Card(
      margin: EdgeInsets.zero,
      shape: shape,
      clipBehavior: isFirst || isLast ? Clip.antiAlias : null,
      child: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: Dismissible(
          key: Key(rankingDoc.id),
          onDismissed: onDismissed,
          confirmDismiss: confirmDismiss,
          background: DismissibleBackground(
            backgroundColor: Colors.orange,
            alignment: Alignment.centerLeft,
            child: Icon(
              ranking.pinned
                  ? CupertinoIcons.pin_slash_fill
                  : CupertinoIcons.pin_fill,
            ),
          ),
          secondaryBackground: const DismissibleBackground(
            child: Icon(Icons.delete_forever),
          ),
          child: ListTile(
            onTap: () {
              Routemaster.of(context)
                  .push('${RankingDetailPage.routeName}/${rankingDoc.id}');
            },
            dense: true,
            shape: isLast
                ? null
                : Border(
                    bottom: BorderSide(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
            contentPadding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
            leading: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (ranking.pinned)
                  const Icon(
                    CupertinoIcons.pin_fill,
                    size: 20,
                    color: Colors.orange,
                  )
                else
                  Icon(
                    CupertinoIcons.pin,
                    size: 20,
                    color: Colors.grey[200],
                  ),
                const SizedBox(width: 6),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: ranking.imageUrl == null
                      ? null
                      : CachedNetworkImageProvider(ranking.imageUrl!),
                  child: ranking.imageUrl == null
                      ? const Icon(
                          Icons.emoji_events,
                          color: Colors.grey,
                        )
                      : null,
                ),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              ranking.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
