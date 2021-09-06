import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking_member.dart';
import '../references/ranking_member_reference.dart';

final rankingMemberRepositoryProvider =
    Provider<RankingMemberRepository>((ref) {
  return const RankingMemberRepository();
});

/// ランキングコレクションのデータ操作を行う
class RankingMemberRepository {
  const RankingMemberRepository();

  Stream<QuerySnapshot<RankingMember>> allStream({
    required String rankingId,
  }) {
    final stream = rankingMembersRef(rankingId: rankingId).snapshots();
    return stream;
  }

  Future<void> add(
    RankingMember data, {
    required String rankingId,
  }) async {
    await rankingMembersRef(rankingId: rankingId).add(data);
  }

  Future<void> deleteMember({
    required String rankingId,
    required String memberId,
  }) async {
    await rankingMemberRef(rankingId: rankingId, memberId: memberId).delete();
  }

  Future<void> updateMember({
    required String rankingId,
    required String memberId,
    int? ranking,
    String? title,
    String? commet,
    String? imageUrl,
  }) async {
    await rankingMemberRef(rankingId: rankingId, memberId: memberId).update({
      if (ranking != null) RankingMemberField.order: ranking,
      if (title != null) RankingMemberField.title: title,
      if (commet != null) RankingMemberField.comment: commet,
      if (imageUrl != null) RankingMemberField.imageUrl: imageUrl,
    }.suppelementTimestamp());
  }
}
