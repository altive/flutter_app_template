import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/references/my_ranking_reference.dart';

final createRankingFromTitle =
    Provider((ref) => CreateRankingFromTitle(ref.read));

/// Create new ranking document by title.
class CreateRankingFromTitle {
  CreateRankingFromTitle(this._read);

  final Reader _read;
  late final CollectionReference<Ranking> _myRankingColRef =
      _read(myRankingColRefProvider);

  void call(String title) {
    if (title.isEmpty) {
      return;
    }
    final ranking = Ranking(title: title);
    _myRankingColRef.add(ranking);
  }
}
