import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking_member.dart';
import '../domain/my_ranking/repositories/ranking_member_repository.dart';

final addRankingMemberFromTitle =
    Provider((ref) => AddRankingMemberFromTitle(ref.read));

/// Create new ranking member document by title.
class AddRankingMemberFromTitle {
  const AddRankingMemberFromTitle(this._read);

  final Reader _read;

  void call(
    String title, {
    required String rankingId,
  }) {
    if (title.isEmpty) {
      return;
    }
    final member = RankingMember(title: title);
    _read(rankingMemberRepositoryProvider).add(
      member,
      rankingId: rankingId,
    );
  }
}
