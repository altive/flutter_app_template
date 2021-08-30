import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking.dart';
import '../repositories/ranking_repository.dart';

/// ランキングコレクションを提供する
final rankingsProvider =
    Provider<AsyncValue<List<QueryDocumentSnapshot<Ranking>>>>((ref) {
  final repository = ref.watch(rankingRepositoryProvider);
  repository.allStream().listen((e) async {
    ref.state = AsyncValue.data(e.docs);
  });
  return const AsyncValue.loading();
});
