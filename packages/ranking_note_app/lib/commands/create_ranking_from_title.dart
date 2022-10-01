import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../feature/my_ranking/entities/ranking.dart';
import '../feature/my_ranking/references/my_ranking_reference.dart';

final createRankingFromTitle = Provider(CreateRankingFromTitle.new);

/// Create new ranking document by title.
class CreateRankingFromTitle {
  CreateRankingFromTitle(this._ref);

  final Ref _ref;
  CollectionReference<Ranking> get _myRankingColRef =>
      _ref.read(myRankingColRefProvider);

  Future<void> call(String title) async {
    if (title.isEmpty) {
      return;
    }
    final ranking = Ranking(title: title);
    await _myRankingColRef.add(ranking);
  }
}
