import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../util/barcode_scanner_service.dart';
import '../search_result/search_result_controller.dart';
import '../search_result/search_result_view.dart';
import 'search_entrance_controller.dart';

/// バーコードを撮影する選択するボタン
class BarcodeScannerButton extends HookConsumerWidget {
  const BarcodeScannerButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> takeBarcode() async {
      final String? barcodeString;
      try {
        barcodeString = await startScanningBarcode();
      } on Exception {
        // カメラ使用拒否されていた場合は設定画面へ促す
        // 現状このcatchには入らず、パッケージのダイアログが表示される🤔
        final result = await showOkCancelAlertDialog(
          context: context,
          message: 'バーコードのスキャンにはカメラへのアクセス許可が必要です。',
          okLabel: '設定を開く',
          cancelLabel: 'キャンセル',
          defaultType: OkCancelAlertDefaultType.ok,
        );
        switch (result) {
          case OkCancelResult.ok:
            await openAppSettings();
            return;
          case OkCancelResult.cancel:
            return;
        }
      }
      if (barcodeString == null) {
        return;
      }
      final controller = ref.read(searchEntranceProvider.notifier)
        ..editSearchText(barcodeString);
      final params =
          controller.genetateParams(category: SearchItemsCategory.all);
      // 検索結果画面へ遷移
      ref.read(searchParamProvider.state).state = params;
      await Navigator.of(context).pushNamed(
        SearchResultView.routeName,
      );
    }

    return ListTile(
      dense: true,
      title: const Icon(MdiIcons.barcodeScan),
      subtitle: const Text(
        'バーコード',
        textAlign: TextAlign.center,
      ),
      onTap: takeBarcode,
    );
  }
}
