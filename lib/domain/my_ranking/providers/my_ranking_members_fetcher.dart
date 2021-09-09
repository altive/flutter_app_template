import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking_member.dart';
import '../references/ranking_member_reference.dart';
import 'my_ranking_provider.dart';

// Provide multiple documents.

final myRankingMembersFetcher =
    StreamProvider.family<QuerySnapshot<RankingMember>, String>((
  ref,
  rankingId,
) {
  return rankingMembersRef(rankingId: rankingId).limit(10).snapshots();
});

final myOrderedRankingMembersProvider = Provider.family<
    AsyncValue<List<QueryDocumentSnapshot<RankingMember>>>, String>((
  ref,
  rankingId,
) {
  final asyncValue = ref.watch(myRankingMembersFetcher(rankingId));
  if (asyncValue is AsyncLoading) {
    return const AsyncValue.loading();
  }
  final memberDocsSnapshot = asyncValue.data!.value;
  final orders =
      ref.watch(myRankingProvider(rankingId)).data?.value.data()?.orders ?? [];
  if (orders.isEmpty) {
    // 順序がなければそのまま返す
    return AsyncValue.data(memberDocsSnapshot.docs);
  }
  // 並び替えて返す
  final sorted = orders
      .map(
        (orderId) => memberDocsSnapshot.docs
            .firstWhere((snapshot) => snapshot.id == orderId),
      )
      .toList();
  return AsyncValue.data(sorted);
});
