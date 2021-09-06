import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking_member.dart';
import '../references/ranking_member_reference.dart';

// Provide multiple documents.

/// 詳細画面を表示するランキングのID
// final detailMyRankingId =
//     StateProvider<String>((ref) => throw UnimplementedError());

final myRankingMembersFetcher = StateNotifierProvider.family<
    MyRankingMembersFetcher,
    AsyncValue<List<QueryDocumentSnapshot<RankingMember>>>,
    String>((
  ref,
  rankingId,
) {
  return MyRankingMembersFetcher(rankingId);
});

class MyRankingMembersFetcher extends StateNotifier<
    AsyncValue<List<QueryDocumentSnapshot<RankingMember>>>> {
  MyRankingMembersFetcher(
    String rankingId,
  ) : super(const AsyncValue.loading()) {
    // 初回データ取得
    final subscription = rankingMembersRef(rankingId: rankingId)
        .orderBy(RankingMemberField.order)
        .limit(15)
        .snapshots()
        .listen((snapshot) {
      state = AsyncValue.data(snapshot.docs);
    });
    _subscriptions.add(subscription);
  }

  final List<StreamSubscription<QuerySnapshot<RankingMember>>> _subscriptions =
      [];

  /// 最後に取得したドキュメントを渡し、それ以降のドキュメントのスナップショットを取得する。
  void next({
    required String rankingId,
    required DocumentSnapshot<RankingMember> lastDoccument,
  }) {
    final subscription = rankingMembersRef(rankingId: rankingId)
        .orderBy(RankingMemberField.order)
        .limit(10)
        .startAfterDocument(lastDoccument)
        .snapshots()
        .listen((snapshot) {
      final alreadyDocs = state.data?.value ?? [];
      state = AsyncValue.data([
        ...alreadyDocs,
        ...snapshot.docs,
      ]);
    });
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
