import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking_member.dart';
import '../references/ranking_member_reference.dart';

// Provide multiple documents.

/// `rankingId` を渡し、ランク順に並び替えられているランキングメンバーを提供する。
final myRankingMembersProvider =
    StreamProvider.family<QuerySnapshot<RankingMember>, String>((
  ref,
  rankingId,
) {
  return ref
      .watch(myRankingMemberColRefProvider(rankingId))
      .orderBy(RankingMemberField.order)
      .snapshots();
});
