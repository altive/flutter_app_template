import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../commons/json_converter/timestamp_supplementer.dart';
import '../../../commons/providers/firebase_storage_provider.dart';
import '../../../commons/providers/firestore_provider.dart';
import '../../authenticator/auth_user_provider.dart';
import '../entities/ranking.dart';

/// Provide a Collection reference.
final myRankingColRefProvider = Provider((ref) {
  final uid = ref.watch(uidProvider).value!;
  return ref
      .watch(firestoreProvider)
      .collection('users/$uid/rankings')
      .withConverter(
        fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
});

/// Provide a Document reference.
final myRankingDocRefProvider =
    Provider.family<DocumentReference<Ranking>, String>((
  ref,
  rankingId,
) {
  final uid = ref.watch(uidProvider).value!;
  return ref
      .watch(firestoreProvider)
      .collection('users/$uid/rankings')
      .doc(rankingId)
      .withConverter(
        fromFirestore: (doc, _) => Ranking.fromJson(doc.data()!),
        toFirestore: (entity, _) => entity.toJson().suppelementTimestamp(),
      );
});

/// Firebase Storage: rankings/:rankingId/:uuid
final newRankingImageRefProvider =
    Provider.family<Reference, String>((ref, rankingId) {
  return ref
      .watch(firebaseStorageProvider)
      .ref('rankings')
      .child(rankingId)
      .child(const Uuid().v4());
});
