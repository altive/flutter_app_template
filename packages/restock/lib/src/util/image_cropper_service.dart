import 'dart:io';

import 'package:image_cropper/image_cropper.dart';

/// 画像ファイル[imageFile]を渡し、画像をクロッピングできる画面を表示する
/// クロッピング結果の[File]を非同期で返す。キャンセルした場合は`null`を返す
Future<File?> presentImageCroppingView(File imageFile) async {
  const screenTitle = '写真の編集';

  /// クロップ画面を表示し、結果を受け取る
  final croppedImageFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: screenTitle,
      // デフォルトで選択されているアスペクト比
      initAspectRatio: CropAspectRatioPreset.ratio4x3,
    ),
    iosUiSettings: const IOSUiSettings(
      title: screenTitle,
      // キャンセルがタップされた時、変更がある場合は確認ダイアログを表示する
      showCancelConfirmationDialog: true,
    ),
  );
  return croppedImageFile;
}
