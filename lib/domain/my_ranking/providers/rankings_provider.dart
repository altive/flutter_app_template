import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking.dart';
import '../references/ranking_reference.dart';

/// Provide the Stream of all documents.
final rankingsProvider =
    Provider<AsyncValue<List<QueryDocumentSnapshot<Ranking>>>>((ref) {
  rankingsRef.snapshots().listen((e) async {
    ref.state = AsyncValue.data(e.docs);
  });
  return const AsyncValue.loading();
});
