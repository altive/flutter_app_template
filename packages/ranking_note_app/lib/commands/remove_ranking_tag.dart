import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/my_ranking/entities/ranking.dart';
import '../feature/my_ranking/references/my_ranking_reference.dart';

final removeRankingTagProvider = Provider((ref) {
  return RemoveRankingTag(ref);
});

class RemoveRankingTag {
  RemoveRankingTag(this._ref);

  final Ref _ref;
  DocumentReference<Ranking> _myRankingDocRef(String rankingId) =>
      _ref.read(myRankingDocRefProvider(rankingId));

  Future<void> call({
    required String rankingId,
    required String tag,
  }) async {
    await _myRankingDocRef(rankingId).update({
      Ranking.tagsField: FieldValue.arrayRemove(<String>[tag]),
    });
  }
}
