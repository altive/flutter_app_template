import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/my_ranking/entities/ranking.dart';
import '../domain/my_ranking/references/ranking_reference.dart';

final overwriteRankingProvider = Provider<OverwriteRanking>((ref) {
  return const OverwriteRanking();
});

/// Overwtire ranking document.
class OverwriteRanking {
  const OverwriteRanking();

  /// タイトル・説明・画像を変更できる
  Future<void> call({
    required String title,
    required String description,
    File? imageFile,
    required bool imageRemoved,
    required DocumentSnapshot<Ranking> doc,
  }) async {
    assert(title.isNotEmpty);

    var newData = doc.data()!.copyWith(
          title: title.trim(),
          description: description.trim(),
        );

    if (imageFile != null) {
      // 写真ファイルがある＝写真を上書き保存する必要がある
      final ref = rankingImageRef(
        rankingId: doc.id,
      );
      // 写真をStorageにアップロードする。
      await ref.putFile(
        imageFile,
        SettableMetadata(cacheControl: 'public, max-age=31536000'),
      );
      newData = newData.copyWith(imageUrl: await ref.getDownloadURL());
    } else if (imageRemoved) {
      // 新しい写真ファイルが無い＆写真が削除されていた場合はImageURLを削除する
      newData = newData.copyWith(imageUrl: null);
    }

    await doc.reference.set(newData);
  }
}
