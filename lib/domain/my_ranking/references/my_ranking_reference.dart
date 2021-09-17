import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking.dart';

/// Reference
CollectionReference<Ranking> myRankingColRef(String uid) {
  return FirebaseFirestore.instance
      .collection('users/$uid/rankings')
      .withConverter(
        fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
}

/// Reference
DocumentReference<Ranking> myRankingDocRef({
  required String rankingId,
  required String uid,
}) {
  return FirebaseFirestore.instance
      .collection('users/$uid/rankings')
      .doc(rankingId)
      .withConverter(
        fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
}

/// Firebase Storage: rankings/[rankingId]/[filePath]
/// if filePath is null, Generate uuid.
Reference myRankingImageRef({
  required String rankingId,
  String? filePath,
}) {
  final path = filePath ?? const Uuid().v4();
  return FirebaseStorage.instance.ref('rankings').child(rankingId).child(path);
}
