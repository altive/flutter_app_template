import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/ranking_member.dart';
import '../repositories/ranking_member_repository.dart';

/// ランキングメンバーコレクションを提供する
final rankingMembersProvider = Provider.family.autoDispose<
    AsyncValue<List<QueryDocumentSnapshot<RankingMember>>>, String>((ref, id) {
  ref
      .watch(rankingMemberRepositoryProvider)
      .allStream(rankingId: id)
      .listen((e) {
    ref.state = AsyncValue.data(e.docs);
  });
  return const AsyncValue.loading();
});
