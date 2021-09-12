import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sort_key_generator/sort_key_generator.dart';

import '../domain/my_ranking/entities/ranking_member.dart';
import '../domain/my_ranking/repositories/ranking_member_repository.dart';

final addRankingMember = Provider((ref) => AddRankingMemberFromTitle(ref.read));

/// Create new ranking member document by title.
class AddRankingMemberFromTitle {
  const AddRankingMemberFromTitle(this._read);

  final Reader _read;

  void call({
    required String rankingId,
    required String title,
    required String description,
    required int targetIndex,
    required List<QueryDocumentSnapshot<RankingMember>> memberDocs,
  }) {
    assert(title.isNotEmpty);

    final previousIndex = targetIndex - 1;
    final previous = previousIndex.isNegative
        ? null
        : memberDocs[previousIndex].data().order;
    final nextIndex = targetIndex + 1;
    final next = nextIndex >= memberDocs.length
        ? null
        : memberDocs[nextIndex].data().order;
    final order = generateSortKeyDouble(previous: previous, next: next);
    if (order == null) {
      return;
    }
    final member = RankingMember(
      title: title,
      description: description,
      order: order,
    );
    _read(rankingMemberRepositoryProvider).add(
      member,
      rankingId: rankingId,
    );
  }
}
