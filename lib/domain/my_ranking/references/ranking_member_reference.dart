import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/ranking_member.dart';
import 'ranking_reference.dart';

const _cPath = 'members';

/// rankings/[rankingId]/members コレクションの参照を取得する
CollectionReference<RankingMember> rankingMembersRef({
  required String rankingId,
}) {
  return rankingsRef.doc(rankingId).collection(_cPath).withConverter(
        fromFirestore: (doc, _) => RankingMember.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson(),
      );
}

/// rankings/[rankingId]/members/[memberId] ドキュメントの参照を取得する
DocumentReference<RankingMember> rankingMemberRef({
  required String rankingId,
  required String memberId,
}) {
  return rankingRef(rankingId: rankingId)
      .collection(_cPath)
      .doc(memberId)
      .withConverter(
        fromFirestore: (doc, _) => RankingMember.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson(),
      );
}
