import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking.dart';
import '../references/ranking_reference.dart';

final myRankingsFetcher = StateNotifierProvider<MyRankingsFetcher,
    AsyncValue<List<QueryDocumentSnapshot<Ranking>>>>((ref) {
  return MyRankingsFetcher();
});

class MyRankingsFetcher
    extends StateNotifier<AsyncValue<List<QueryDocumentSnapshot<Ranking>>>> {
  MyRankingsFetcher() : super(const AsyncValue.loading()) {
    // 初回データ取得
    final subscription = rankingsRef
        .orderBy(RankingField.pinned, descending: true)
        .orderBy(TimestampField.updatedAt, descending: true)
        .limit(15)
        .snapshots()
        .listen((snapshot) {
      state = AsyncValue.data(snapshot.docs);
    });
    _subscriptions.add(subscription);
  }

  final List<StreamSubscription<QuerySnapshot<Ranking>>> _subscriptions = [];

  /// 最後に取得したドキュメントを渡し、それ以降のドキュメントのスナップショットを取得する。
  void next(DocumentSnapshot<Ranking> lastDoc) {
    final subscription = rankingsRef
        .orderBy(RankingField.pinned, descending: true)
        .orderBy(TimestampField.updatedAt, descending: true)
        .limit(10)
        .startAfterDocument(lastDoc)
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
