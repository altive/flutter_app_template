import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/image_cropper_service.dart';
import '../../util/image_picker_helper.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';

/// アルバムから選択するボタン
class PhotoAlbumButton extends HookConsumerWidget {
  const PhotoAlbumButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      dense: true,
      title: const Icon(Icons.photo_library),
      subtitle: const Text(
        'アルバム',
        textAlign: TextAlign.center,
      ),
      onTap: () => _pickPhotoFromAlbum(ref, context),
    );
  }
}

/// アルバムから写真を選択
Future<void> _pickPhotoFromAlbum(WidgetRef ref, BuildContext context) async {
  // TODO(Riscait): まだ許可取ってない場合
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
  ref.read(stockEditorParameterProvider.state).state =
      StockEditorParameter.createrWithPhoto(imageFile: croppedFile);
  // ストック作成結果画面へ遷移
  await Navigator.of(context).pushNamed(
    StockEditorPage.routeName,
  );
}
