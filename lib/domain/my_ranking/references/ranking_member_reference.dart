import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking_member.dart';
import 'ranking_reference.dart';

const _cPath = 'members';

/// rankings/[rankingId]/members コレクションの参照を取得する
CollectionReference<RankingMember> rankingMembersRef({
  required String rankingId,
}) {
  return rankingsRef.doc(rankingId).collection(_cPath).withConverter(
        fromFirestore: (doc, _) => RankingMember.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
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
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
}

/// Firebase Storage: rankings/[rankingId]/members/[filePath]
/// if filePath is null, Generate uuid.
Reference rankingMemberImageRef({
  required String rankingId,
  required String memberId,
  String? filePath,
}) {
  final path = filePath ?? const Uuid().v4();
  return FirebaseStorage.instance
      .ref('rankings')
      .child(rankingId)
      .child('members')
      .child(memberId)
      .child(path);
}
