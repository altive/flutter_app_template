import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/repositories/ranking_repository.dart';

final createRankingFromTitle =
    Provider((ref) => CreateRankingFromTitle(ref.read));

class CreateRankingFromTitle {
  const CreateRankingFromTitle(this._read);

  final Reader _read;

  void call(String title) {
    if (title.isEmpty) {
      return;
    }
    final ranking = Ranking(title: title);
    _read(rankingRepositoryProvider).add(ranking);
  }
}
