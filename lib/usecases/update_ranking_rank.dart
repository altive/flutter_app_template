import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/providers/my_ranking_provider.dart';
import '../domain/my_ranking/references/ranking_reference.dart';

final updateRankingRank = Provider((ref) => UpdateRankingRank(ref.read));

/// ランキングのランク（並び順序）を更新する
class UpdateRankingRank {
  const UpdateRankingRank(this._read);

  final Reader _read;

  Future<void> call({
    required String rankingId,
    required int oldIndex,
    required int newIndex,
  }) async {
    // 変更前のランキングドキュメントを取得
    final doc = await _read(myRankingProvider(rankingId).last);
    final oldRanking = doc.data()!;
    // ランク順序
    final orders = oldRanking.orders;
    final removedId = orders.removeAt(oldIndex);
    final newOrder = oldIndex < newIndex ? newIndex - 1 : newIndex;
    orders.insert(newOrder, removedId);
    // 変更後の順序に更新したランキングを作成
    final newRanking = oldRanking.copyWith(orders: orders);
    // ランキングドキュメントを更新
    await rankingRef(rankingId: rankingId).set(newRanking);
  }
}
