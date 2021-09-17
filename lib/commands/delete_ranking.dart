import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/authenticator/auth_user_provider.dart';
import '../domain/my_ranking/references/my_ranking_reference.dart';

final deleteRankingProvider = Provider<DeleteRanking>((ref) {
  return DeleteRanking(ref.read);
});

class DeleteRanking {
  const DeleteRanking(this._read);

  final Reader _read;
  String get _uid => _read(uidProvider).data!.value!;

  // TODO(Riscait): Delete storage images.
  Future<void> call({
    required String rankingId,
  }) async {
    await myRankingDocRef(rankingId: rankingId, uid: _uid).delete();
  }
}
