import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/stock/stock_entity.dart';
import '../../everyones_stock/everyones_stock_model.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import '../../utils/utils.dart';

/// ストックアイテムをシェアする
void shareWithStock(
  StockEntity item, {
  // iPadで表示できない不具合あり、sharePositionOriginでsizeを指定している
  // https://github.com/flutter/flutter/issues/47220
  required Size size,
}) {
  final mainText =
      '『${item.name}』${item.numberOfItems.toInt()}個を「リストック」でストック中♪';
  final urlText = '#ReStockApp ${item.amazonUrl ?? ''}';
  _share(
    text: '$mainText $urlText',
    sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
  );
}

/// PAAPIアイテムをシェアする
void shareWithPaapi(
  PaapiSearchItem item, {
  // iPadで表示できない不具合あり、sharePositionOriginでsizeを指定している
  // https://github.com/flutter/flutter/issues/47220
  required Size size,
}) {
  final text = '『${item.displayTitle}』 #ReStockApp ${item.detailPageUrl ?? ''}';
  _share(
    text: text,
    sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
  );
}

/// タイムラインアイテムをシェアする
void shareWithEveryonesStock(
  EveryonesStockModel item, {
  // iPadで表示できない不具合あり、sharePositionOriginでsizeを指定している
  // https://github.com/flutter/flutter/issues/47220
  required Size size,
}) {
  final text = '『${item.name}』 #ReStockApp ${item.amazonUrl}';
  _share(
    text: text,
    sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
  );
}

/// お気に入りアイテムをシェアする
void shareWithFavorite(
  FavoriteItem item, {
  // iPadで表示できない不具合あり、sharePositionOriginでsizeを指定している
  // https://github.com/flutter/flutter/issues/47220
  required Size size,
}) {
  final text =
      '『${item.name}』をお気に入りに登録しています！ #ReStockApp ${item.amazonUrl ?? ''}';
  _share(
    text: text,
    sharePositionOrigin: Rect.fromLTWH(0, 0, size.width, size.height / 2),
  );
}

/// Shareパッケージでシェアする
void _share({
  required String text,
  required Rect sharePositionOrigin,
}) {
  try {
    Share.share(
      text,
      sharePositionOrigin: sharePositionOrigin,
    );
  } on PlatformException catch (exception) {
    logger.warning(exception);
  } on FormatException catch (exception) {
    logger.warning(exception);
  }
}
