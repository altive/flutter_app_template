import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking.dart';
import '../references/ranking_reference.dart';

// Provide a single document.

/// Return a ranking document by `rankingId`.
final myRankingProvider =
    StreamProvider.family<DocumentSnapshot<Ranking>, String>((
  ref,
  rankingId,
) {
  return rankingRef(rankingId: rankingId).snapshots();
});
