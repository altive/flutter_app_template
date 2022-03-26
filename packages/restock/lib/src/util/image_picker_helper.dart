import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

Future<File?> pickUpImageFromAlbum(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile == null) {
    logger.fine('Pick image cancelled.');
    return null;
  }
  final file = File(pickedFile.path);
  return file;
}

Future<File?> pickUpImageFromCamera(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedFile == null) {
    logger.fine('Pick image cancelled.');
    return null;
  }
  final file = File(pickedFile.path);
  return file;
}

/// 非常にまれですが、Androidシステムがimage_pickerの終了後に
/// MainActivityを強制終了することがあります。
/// これが発生すると、image_pickerから選択されたデータが失われます。
/// retrieveLostDataこの状況で失われたデータを取得するために使用できます。
/// これがいつ発生したかを検出する方法はないため、
/// 適切な場所でこのメソッドを呼び出すことが不可欠です。
/// これを何らかのスタートアップチェックに組み込むことをお勧めします。
/// 使用例については、サンプルアプリを参照してください。
/// https://pub.dev/packages/image_picker#-example-tab
Future<void> retrieveLostData() async {
  final lostData = await ImagePicker().retrieveLostData();

  if (lostData.file == null) {
    logger.warning('LostDataResponseがnull');
    return;
  }

  if (lostData.type == RetrieveType.image) {
    logger.fine(lostData.file);
  }
}
