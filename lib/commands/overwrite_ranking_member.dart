import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking_member.dart';

final overwriteRankingMember =
    Provider((ref) => const OverwriteRankingMember());

/// Overwtire ranking member document.
class OverwriteRankingMember {
  const OverwriteRankingMember();

  /// タイトル・説明・画像を変更できる
  void call({
    required String title,
    required String description,
    required QueryDocumentSnapshot<RankingMember> memberDoc,
  }) {
    assert(title.isNotEmpty);

    memberDoc.reference.set(
      memberDoc.data().copyWith(
            title: title.trim(),
            description: description.trim(),
          ),
    );
  }
}
