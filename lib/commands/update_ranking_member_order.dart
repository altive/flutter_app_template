import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sort_key_generator/sort_key_generator.dart';

import '../domain/authenticator/auth_user_provider.dart';
import '../domain/my_ranking/entities/ranking_member.dart';
import '../domain/my_ranking/references/ranking_member_reference.dart';

final updateRankingMemberOrder =
    Provider((ref) => UpdateRankingMemberOrder(ref.read));

/// ランキングメンバーのランク（並び順序）を更新する
class UpdateRankingMemberOrder {
  const UpdateRankingMemberOrder(this._read);

  final Reader _read;
  String get _uid => _read(uidProvider).data!.value!;

  Future<void> call({
    required String rankingId,
    required String memberId,
    required List<QueryDocumentSnapshot<RankingMember>> memberDocs,
    required RankingMember oldMember,
    required int newIndex,
  }) async {
    final previousIndex = newIndex - 1;
    final previous = previousIndex.isNegative
        ? null
        : memberDocs[previousIndex].data().order;
    final nextIndex = newIndex + 1;
    final next = nextIndex >= memberDocs.length
        ? null
        : memberDocs[nextIndex].data().order;
    final newOrder = generateSortKeyDouble(
      previous: previous,
      next: next,
    );
    if (newOrder == null) {
      // 1075回を超えて並び替えされたため失敗。全ドキュメントにorderを振り直す必要あり。
      final newDocs = <QueryDocumentSnapshot<RankingMember>>[];
      for (var i = 0; i < memberDocs.length; i++) {
        final memberDoc = memberDocs[i];
        await memberDoc.reference.set(
          memberDoc.data().copyWith(order: i.toDouble()),
        );
        newDocs.add(memberDoc);
      }
      // 再実行
      return call(
        rankingId: rankingId,
        memberId: memberId,
        memberDocs: newDocs,
        oldMember: oldMember,
        newIndex: newIndex,
      );
    }
    final memberRef = myRankingMemberDocRef(
      uid: _uid,
      rankingId: rankingId,
      memberId: memberId,
    );
    final newMember = oldMember.copyWith(order: newOrder);
    await memberRef.set(newMember);
  }
}
