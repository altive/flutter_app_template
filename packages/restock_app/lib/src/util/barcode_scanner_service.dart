import 'dart:io';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

/// バーコードをスキャンする
Future<String?> startScanningBarcode() async {
  final result = await FlutterBarcodeScanner.scanBarcode(
    '#ff0000',
    'キャンセル',
    // iOSでフラッシュアイコンが正しく表示されない不具合があるため、Androidでのみ `true`
    // https://github.com/AmolGangadhare/flutter_barcode_scanner/issues/82
    Platform.isAndroid,
    ScanMode.BARCODE,
  );
  if (result == '-1') {
    // キャンセルすると -1 が返ってくる
    return null;
  }
  return result;
}
