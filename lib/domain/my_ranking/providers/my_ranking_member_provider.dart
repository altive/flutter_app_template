import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking_member.dart';
import '../references/ranking_member_reference.dart';

// Provide a single document.

/// Return the last ranking member by `rankingId`.
final myRankingMemberLastProvider =
    StreamProvider.family<QuerySnapshot<RankingMember>, String>((
  ref,
  rankingId,
) {
  return rankingMembersRef(rankingId: rankingId)
      .orderBy(RankingMemberField.order)
      .limitToLast(1)
      .snapshots();
});

/// Return the order of the last ranking member by `rankingId`.
final myRankingMemberLastOrder = Provider.family<AsyncValue<int>, String>((
  ref,
  rankingId,
) {
  final snapshot =
      ref.watch(myRankingMemberLastProvider(rankingId)).data?.value;
  if (snapshot == null) {
    return const AsyncValue.loading();
  }
  return AsyncValue.data(snapshot.docs.first.data().order);
});

// /// ランキングメンバーコレクションを提供する
// final rankingMembersProvider = Provider.family.autoDispose<
//     AsyncValue<List<QueryDocumentSnapshot<RankingMember>>>, String>((
//   ref,
//   rankingId,
// ) {
//   rankingMembersRef(
//     rankingId: rankingId,
//   ).snapshots().listen((e) {
//     ref.state = AsyncValue.data(e.docs);
//   });
//   return const AsyncValue.loading();
// });
