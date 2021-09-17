import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/references/ranking_reference.dart';

final deleteRankingProvider = Provider<DeleteRanking>((ref) {
  return const DeleteRanking();
});

class DeleteRanking {
  const DeleteRanking();

  // TODO(Riscait): Delete storage images.
  Future<void> call({
    required String rankingId,
  }) async {
    // // Storage/rankings/:rankingId フォルダの参照リストを取得
    // final rankingStorageList =
    //     await rankingStorageRef(rankingId: rankingId).listAll();
    // // フォルダ内の各画像をすべて削除するFutureリスト
    // final deleteRankingImages = rankingStorageList.items.map((e) => e.delete());

    // // Storage/rankings/:rankingId/members フォルダの参照リストを取得
    // final rankingMemberStorageList =
    //     await rankingMembersStorageRef(rankingId: rankingId).listAll();
    // // フォルダ内の各:memberフォルダの参照リストリストを取得
    // final futures = rankingMemberStorageList.items.map(
    //   (e) => e.listAll(),
    // );
    // // 各memberの全ての画像を削除するFutureリスト
    // final rankingMembersStorageList = await Future.wait(futures);
    // final deleteRankingMembersImages = rankingMembersStorageList
    //     .map((e) => e.items.map((e) => e.delete()))
    //     .expand((pair) => pair);

    await Future.wait([
      rankingRef(rankingId: rankingId).delete(),
      // ...deleteRankingImages,
      // ...deleteRankingMembersImages,
    ]);
  }
}
