import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../entities/ranking.dart';

const _cPath = 'rankings/v1/rankings';

/// rankingsコレクションの参照を取得する
final rankingsRef = FirebaseFirestore.instance.collection(_cPath).withConverter(
      fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
      toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
    );

/// rankings/[rankingId] ドキュメントの参照を取得する
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
