import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../util/nickname_maker.dart';
import '../../utils/utils.dart';
import 'me_entity.dart';

/// リポジトリを提供
final meRepositoryProvider = Provider<MeRepository?>((ref) {
  final user = ref.watch(authControllerProvider);
  if (user == null) {
    return null;
  }
  return MeRepository(ref.read, user);
});

/// Streamを提供
final meEntityStreamProvider = StreamProvider<MeEntity>((ref) {
  final repository = ref.watch(meRepositoryProvider);
  if (repository == null) {
    return const Stream.empty();
  }
  return ref.watch(meRepositoryProvider)!.stream();
});

/// Meを提供
final meEntityProvider = Provider<MeEntity?>((ref) {
  return ref.watch(meEntityStreamProvider).value;
});

/// Meのリポジトリ
class MeRepository {
  MeRepository(this._read, this._user);

  // ignore: unused_field
  final Reader _read;
  final User _user;

  final _firestore = FirebaseFirestore.instance;
  // MEMO: late を使ってfinalにしたい
  DocumentReference get meRef => _firestore.collection('users').doc(_user.uid);

  Stream<MeEntity> stream() {
    final snapshots = meRef.snapshots();
    return snapshots
        .map((e) => MeEntity.fromJson(e.data()! as Map<String, Object?>));
  }

  /// マイストックの可視性を変更する
  /// ※未公開
  Future<void> updateStockVisibility({required bool isPrivate}) async {
    return meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.isPrivateMyStock: isPrivate,
        },
      ),
    );
  }

  /// ニックネームを付与する
  Future<void> addNickname() async {
    await meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.nickname: generateNickname(),
        },
      ),
    );
  }

  /// ニックネームを更新する
  Future<void> updateNickname(String nickname) async {
    await meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.nickname: nickname,
        },
      ),
    );
  }

  /// ストックグループリストを新しいリストで更新する
  Future<void> updateGroups(List<String> categories) async {
    await meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.groups: categories,
        },
      ),
    );
  }

  /// ストックグループを1つ削除する
  Future<void> removeGroup(String category) async {
    await meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.groups: FieldValue.arrayRemove(<String>[category]),
        },
      ),
    );
  }

  /// ストックグループを1つ追加する
  Future<void> unionGroup(String category) async {
    await meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.groups: FieldValue.arrayUnion(<String>[category]),
        },
      ),
    );
  }

  /// ストックグループを1つ更新する
  ///
  /// Transactionを使う。[newCategory]を追加してから[oldCategory]を削除する。
  Future<void> updateGroup({
    required int? position,
    required String? oldCategory,
    required String newCategory,
  }) async {
    await _firestore.runTransaction((transaction) async {
      // 現在のMeドキュメントを取得する
      final snapshot = await transaction.get(meRef);
      // グループ情報を更新したMeEntityを準備する
      final categories =
          MeEntity.fromJson(snapshot.data()! as Map<String, Object?>).groups ??
              []
            ..insert(position!, newCategory)
            ..remove(oldCategory);
      // 新しいグループ情報でドキュメントを更新する
      transaction.update(
        meRef,
        updateTimestamp(
          json: <String, Object?>{
            MeEntityField.groups: categories,
          },
        ),
      );
    });
  }

  /// 過去のバージョン使用者のためにマイグレーションを行う
  Future<void> migrate({
    required String nickname,
    required List<String> stockCategories,
  }) async {
    return meRef.update(
      updateTimestamp(
        json: <String, Object>{
          MeEntityField.nickname: nickname,
          MeEntityField.groups: stockCategories,
        },
      ),
    );
  }
}
