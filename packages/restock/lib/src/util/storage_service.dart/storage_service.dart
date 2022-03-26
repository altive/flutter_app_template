import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../utils/utils.dart';
import 'storage_photo_variant.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// 画像ファイル[file]を受け取り、Storageにアップロードする。
  /// 完了したら保存場所のダウンロードURLパス[String]を返す。
  /// 失敗したばいは`null`を返す。
  Future<List<String>?> uploadStockItemPhoto(
    File file, {
    required String photoId,
  }) async {
    final user = FirebaseAuth.instance.currentUser!;

    /// 保存場所を指定
    final ref = _storage
        .ref()
        .child('users')
        .child(user.uid)
        .child('stockItems')
        .child(photoId)
        .child('item_photo');

    /// ファイルをアップロードするタスクを作成
    final task = ref.putFile(file);

    try {
      /// ファイルをアップロード
      await task;

      /// 複数種類の写真を保存するStorageのパスリスト
      final storagePathList = StoragePhotoVariant.values
          .map((variant) => '${ref.fullPath}${variant.suffix}')
          .toList();

      return storagePathList;
    } on FirebaseException catch (e) {
      if (task.snapshot.state == TaskState.canceled) {
        logger.fine('canceled');
      } else {
        logger.info(task.snapshot);
      }
      logger.warning(e);
      return null;
    }
  }

  /// 引数のパスから画像をダウンロードする
  Future<String?> downloadStockItemPhoto(String path) async {
    final ref = _storage.ref().child(path);
    try {
      final imageUrl = await ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (e) {
      logger.warning('画像がありません：$e');
      return null;
    }
  }
}
