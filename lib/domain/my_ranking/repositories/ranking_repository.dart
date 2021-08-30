import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking.dart';
import '../references/ranking_reference.dart';

final rankingRepositoryProvider = Provider<RankingRepository>((ref) {
  return const RankingRepository();
});

/// ランキングコレクションのデータ操作を行う
class RankingRepository {
  const RankingRepository();

  Stream<QuerySnapshot<Ranking>> allStream() {
    final stream = rankingsRef.snapshots();
    return stream;
  }

  Future<void> add(Ranking data) async {
    await rankingsRef.add(data);
  }

  Future<void> delete({required String rankingId}) async {
    await rankingRef(rankingId: rankingId).delete();
  }

  Future<void> update({
    required String rankingId,
    String? title,
    String? commet,
    String? imageUrl,
  }) async {
    await rankingRef(rankingId: rankingId).update({
      if (title != null) RankingField.title: title,
      if (commet != null) RankingField.comment: commet,
      if (imageUrl != null) RankingField.imageUrl: imageUrl,
    }.suppelementTimestamp());
  }
}
