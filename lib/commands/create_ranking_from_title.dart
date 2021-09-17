import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/authenticator/auth_user_provider.dart';
import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/references/my_ranking_reference.dart';

final createRankingFromTitle =
    Provider((ref) => CreateRankingFromTitle(ref.read));

/// Create new ranking document by title.
class CreateRankingFromTitle {
  const CreateRankingFromTitle(this._read);

  final Reader _read;
  String get _uid => _read(uidProvider).data!.value!;

  void call(String title) {
    if (title.isEmpty) {
      return;
    }
    final ranking = Ranking(title: title);
    myRankingColRef(_uid).add(ranking);
  }
}
