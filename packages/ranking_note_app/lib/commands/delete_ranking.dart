import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/my_ranking/entities/ranking.dart';
import '../feature/my_ranking/references/my_ranking_reference.dart';

final deleteRankingProvider = Provider<DeleteRanking>((ref) {
  return DeleteRanking(ref);
});

class DeleteRanking {
  DeleteRanking(this._ref);

  final Ref _ref;
  DocumentReference<Ranking> _myRankingDocRef(String rankingId) =>
      _ref.read(myRankingDocRefProvider(rankingId));

  // TODO(Riscait): Delete storage images.
  Future<void> call({required String rankingId}) async {
    await _myRankingDocRef(rankingId).delete();
  }
}
