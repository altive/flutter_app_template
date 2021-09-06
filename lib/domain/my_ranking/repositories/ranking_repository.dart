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

  /// Create a new document with an auto-generated ID.
  Future<void> add(Ranking ranking) async {
    await rankingsRef.add(ranking);
  }

  /// Overwrite a document with the specified ID.
  Future<void> overwrite({
    required String rankingId,
    required Ranking ranking,
  }) async {
    await rankingRef(rankingId: rankingId).set(ranking);
  }

  /// Compose to a document with the specified ID.
  Future<void> merge({
    required String rankingId,
    required Ranking ranking,
  }) async {
    await rankingRef(rankingId: rankingId)
        .set(ranking, SetOptions(merge: true));
  }

  /// Delete a document with the specified ID.
  Future<void> delete({required String rankingId}) async {
    await rankingRef(rankingId: rankingId).delete();
  }

  /// Update the Field of the document with the specified ID.
  Future<void> update({
    required String rankingId,
    String? title,
    String? comment,
    String? imageUrl,
  }) async {
    await rankingRef(rankingId: rankingId).update({
      if (title != null) RankingField.title: title,
      if (comment != null) RankingField.comment: comment,
      if (imageUrl != null) RankingField.imageUrl: imageUrl,
    }.suppelementTimestamp());
  }
}
