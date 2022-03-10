import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../util/image_cropper_service.dart';
import '../../util/image_picker_helper.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';

/// アルバムから選択するボタン
class PhotoAlbumButton extends HookWidget {
  const PhotoAlbumButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: const Icon(Icons.photo_library),
      subtitle: const Text(
        'アルバム',
        textAlign: TextAlign.center,
      ),
      onTap: () => _pickPhotoFromAlbum(context),
    );
  }
}

Future<void> _showOpenSettingDialog(BuildContext context) async {
  // カメラ使用拒否されていた場合は設定画面へ促す
  final result = await showOkCancelAlertDialog(
      context: context,
      message: '写真へのアクセス許可が必要です。',
      okLabel: '設定を開く',
      cancelLabel: 'キャンセル',
      defaultType: OkCancelAlertDefaultType.ok);
  switch (result) {
    case OkCancelResult.ok:
      await openAppSettings();
      return;
    case OkCancelResult.cancel:
      return;
  }
}

/// アルバムから写真を選択
Future<void> _pickPhotoFromAlbum(BuildContext context) async {
  final requested = await Permission.photos.request();
  // final status = await Permission.photos.status;
  // if (status.isDenied) {
  //   // まだ許可取ってない
  //   // final requested = await Permission.photos.request();
  //   if (!requested.isGranted) {
  //     await _showOpenSettingDialog(context);
  //     return;
  //   }
  // アルバムから写真を選択
  try {
    final imageFile = await pickUpImageFromAlbum(context);
    if (imageFile == null) {
      // 写真撮影がキャンセルされた時
      return;
    }
    // 写真をクロッピングできる画面を表示し、結果を受け取る
    final croppedFile = await presentImageCroppingView(imageFile);
    if (croppedFile == null) {
      // 写真編集がキャンセルされた時
      return;
    }
    // この時点ではStockItemは作成せず、画像ファイルだけ渡す
    context.read(stockEditorParameterProvider).state =
        StockEditorParameter.createrWithPhoto(imageFile: croppedFile);
    // ストック作成結果画面へ遷移
    await Navigator.of(context).pushNamed(
      StockEditorPage.routeName,
    );
  } on PlatformException catch (e) {
    print(e);
  }
  // }
}
