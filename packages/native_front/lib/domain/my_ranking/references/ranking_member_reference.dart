import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking_member.dart';
import 'my_ranking_reference.dart';

/// Reference
/// rankings/:rankingId/members コレクションの参照を取得する
final myRankingMemberColRefProvider =
    Provider.family<CollectionReference<RankingMember>, String>((
  ref,
  rankingId,
) {
  return ref
      .read(myRankingColRefProvider)
      .doc(rankingId)
      .collection('members')
      .withConverter(
        fromFirestore: (doc, _) => RankingMember.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
});

/// Reference
/// rankings/:rankingId/members/:memberId ドキュメントの参照を取得する
final myRankingMemberDocRefProvider =
    Provider.family<DocumentReference<RankingMember>, Tuple2<String, String>>((
  ref,
  rankingIdAndMemberId,
) {
  return ref
      .read(myRankingDocRefProvider(rankingIdAndMemberId.item1))
      .collection('members')
      .doc(rankingIdAndMemberId.item2)
      .withConverter(
        fromFirestore: (doc, _) => RankingMember.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
});

/// Firebase Storage: rankings/:rankingId/members/:uuid
final newRankingMemberImageRefProvider =
    Provider.family<Reference, Tuple2<String, String>>((
  ref,
  rankingIdAndMemberId,
) {
  return FirebaseStorage.instance
      .ref('rankings')
      .child(rankingIdAndMemberId.item1)
      .child('members')
      .child(rankingIdAndMemberId.item2)
      .child(const Uuid().v4());
});
