import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

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
