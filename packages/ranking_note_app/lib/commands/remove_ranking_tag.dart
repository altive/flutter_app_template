import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/references/my_ranking_reference.dart';

final removeRankingTagProvider = Provider((ref) {
  return RemoveRankingTag(ref.read);
});

class RemoveRankingTag {
  RemoveRankingTag(this._read);

  final Reader _read;
  DocumentReference<Ranking> _myRankingDocRef(String rankingId) =>
      _read(myRankingDocRefProvider(rankingId));

  Future<void> call({
    required String rankingId,
    required String tag,
  }) async {
    await _myRankingDocRef(rankingId).update({
      RankingField.tags: FieldValue.arrayRemove(<String>[tag]),
    });
  }
}
