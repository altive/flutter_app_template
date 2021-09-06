import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking.dart';
import '../references/ranking_reference.dart';

final myRankingFetcher =
    StreamProvider.family<DocumentSnapshot<Ranking>, String>((ref, id) {
  return rankingRef(rankingId: id).snapshots();
});
