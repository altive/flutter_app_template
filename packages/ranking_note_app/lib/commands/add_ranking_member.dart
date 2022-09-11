import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sort_key_generator/sort_key_generator.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

import '../feature/my_ranking/entities/ranking.dart';
import '../feature/my_ranking/references/new_ranking_member_image_reference.dart';

final createRankingMember = Provider((ref) => CreateRankingMember(ref.read));

/// Create new ranking member document by title.
class CreateRankingMember {
  const CreateRankingMember(this._read);

  final Reader _read;

  Reference _newRankingMemberImageRef({
    required String rankingId,
    required String memberId,
  }) {
    return _read(
      newRankingMemberImageRefProvider(
        Tuple2(rankingId, memberId),
      ),
    );
  }

  Future<void> call({
    required String rankingId,
    required String title,
    required String description,
    File? imageFile,
    required int targetIndex,
    required List<RankingMemberQueryDocumentSnapshot> memberDocs,
  }) async {
    assert(title.isNotEmpty);

    final previousIndex = targetIndex - 1;
    final previous =
        previousIndex.isNegative ? null : memberDocs[previousIndex].data.order;
    final nextIndex = targetIndex;
    final next = nextIndex >= memberDocs.length
        ? null
        : memberDocs[nextIndex].data.order;
    final order = generateSortKeyDouble(previous: previous, next: next);
    if (order == null) {
      // TODO(Riscait): Order生成が破綻。振り直しが必要
      return;
    }
    var newMember = RankingMember(
      title: title,
      description: description,
      order: order,
    );

    final memberId = const Uuid().v4();

    if (imageFile != null) {
      // 写真ファイルがあるのでストレージに保存する
      final ref = _newRankingMemberImageRef(
        rankingId: rankingId,
        memberId: memberId,
      );
      await ref.putFile(
        imageFile,
        SettableMetadata(cacheControl: 'public, max-age=31536000'),
      );
      newMember = newMember.copyWith(imageUrl: await ref.getDownloadURL());
    }

    await rankingsRef.doc(rankingId).members.doc(memberId).set(newMember);
  }
}
