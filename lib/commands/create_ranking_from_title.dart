import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/authenticator/auth_user_provider.dart';
import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/repositories/ranking_repository.dart';

final createRankingFromTitle =
    Provider((ref) => CreateRankingFromTitle(ref.read));

class CreateRankingFromTitle {
  const CreateRankingFromTitle(this._read);

  final Reader _read;
  AsyncValue<String?> get _asyncCurrentUser => _read(uidProvider);

  void call(String title) {
    if (title.isEmpty) {
      return;
    }
    final uid = _asyncCurrentUser.data!.value!;
    final ranking = Ranking(userId: uid, title: title);
    _read(rankingRepositoryProvider).add(ranking);
  }
}
