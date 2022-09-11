import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking.dart';

// Provide multiple documents.

/// `rankingId` を渡し、ランク順に並び替えられているランキングメンバーを提供する。
final myRankingMembersProvider =
    StreamProvider.family<RankingMemberQuerySnapshot, String>((
  ref,
  rankingId,
) {
  return rankingsRef
      .doc(rankingId)
      .members
      .orderByFieldPath(FieldPath.fromString(RankingMember.orderField))
      .snapshots();
});
