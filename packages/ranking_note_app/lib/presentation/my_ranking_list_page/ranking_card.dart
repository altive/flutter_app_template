import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commons/widgets/dismissible_background.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../components/image_thumbnail.dart';
import '../components/rounded_card.dart';
import '../router/router.dart';

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

    final ranking = rankingDoc.data();

    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
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
            dense: true,
            contentPadding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
            onTap: () => ref
                .read(routerProvider)
                .navigateToMyRankingDetailPage(rankingId: rankingDoc.id),
            title: Padding(
              padding: EdgeInsets.only(left: ranking.imageUrl == null ? 8 : 0),
              child: Text(
                ranking.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            leading: ranking.imageUrl == null
                ? null
                : ImageThumbnail(imageUrl: ranking.imageUrl),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
