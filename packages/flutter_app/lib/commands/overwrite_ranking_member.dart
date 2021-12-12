import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import '../domain/my_ranking/entities/ranking_member.dart';
import '../domain/my_ranking/references/ranking_member_reference.dart';

final overwriteRankingMember =
    Provider((ref) => OverwriteRankingMember(ref.read));

/// Overwtire ranking member document.
class OverwriteRankingMember {
  const OverwriteRankingMember(this._read);

  final Reader _read;

  Reference _newRankingMemberImageRef({
    required String rankingId,
    required String memberId,
  }) {
    return _read(newRankingMemberImageRefProvider(
      Tuple2(rankingId, memberId),
    ));
  }

  /// タイトル・説明・画像を変更できる
  Future<void> call({
    required String rankingId,
    required String title,
    required String description,
    File? imageFile,
    required bool imageRemoved,
    required QueryDocumentSnapshot<RankingMember> doc,
  }) async {
    assert(title.isNotEmpty);

    var newData = doc.data().copyWith(
          title: title.trim(),
          description: description.trim(),
        );

    if (imageFile != null) {
      // 写真ファイルがある＝写真を上書き保存する必要がある
      final ref = _newRankingMemberImageRef(
        rankingId: rankingId,
        memberId: doc.id,
      );
      // 写真をStorageにアップロードする。
      await ref.putFile(
        imageFile,
        SettableMetadata(cacheControl: 'public, max-age=31536000'),
      );
      newData = newData.copyWith(imageUrl: await ref.getDownloadURL());
    } else if (imageRemoved) {
      // 新しい写真ファイルはない＆写真が削除されていた場合はImageURLを削除する
      newData = newData.copyWith(imageUrl: null);
    }

    await doc.reference.set(newData);
  }
}
