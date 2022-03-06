import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/references/my_ranking_reference.dart';

final deleteRankingProvider = Provider<DeleteRanking>((ref) {
  return DeleteRanking(ref.read);
});

class DeleteRanking {
  DeleteRanking(this._read);

  final Reader _read;
  DocumentReference<Ranking> _myRankingDocRef(String rankingId) =>
      _read(myRankingDocRefProvider(rankingId));

  // TODO(Riscait): Delete storage images.
  Future<void> call({required String rankingId}) async {
    await _myRankingDocRef(rankingId).delete();
  }
}
