import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking.dart';

const _cPath = 'rankings/v1/rankings';

/// Firestore: rankingsコレクションの参照を取得する
final rankingsRef = FirebaseFirestore.instance.collection(_cPath).withConverter(
      fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
      toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
    );

/// Firestore: rankings/[rankingId] ドキュメントの参照を取得する
DocumentReference<Ranking> rankingRef({
  required String rankingId,
}) {
  return FirebaseFirestore.instance
      .collection(_cPath)
      .doc(rankingId)
      .withConverter(
        fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
}

/// Firebase Storage: rankings/[rankingId]/[filePath]
/// if filePath is null, Generate uuid.
Reference rankingImageRef({
  required String rankingId,
  String? filePath,
}) {
  final path = filePath ?? const Uuid().v4();
  return FirebaseStorage.instance.ref('rankings').child(rankingId).child(path);
}
