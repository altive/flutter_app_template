import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../firestore_provider.dart';
import '../models/user.dart';

part 'user_state_provider.g.dart';

/// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
///
/// [userId] の [User] を返す。
/// [userId] の [User] が存在しない場合は null を返す。
@riverpod
class UserState extends _$UserState {
  @override
  Stream<User?> build({required String userId}) async* {
    yield* ref
        .watch(firestoreProvider)
        .doc(User.docPath(userId: userId))
        .withConverter(
          fromFirestore: User.fromFirestore,
          toFirestore: User.toFirestore,
        )
        .snapshots()
        .map((s) => s.data());
  }
}
