import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../common_widgets/url_image.dart';
import '../../core/stock/stock_entity.dart';
import '../../utils/utils.dart';

class StockListImageView extends HookWidget {
  const StockListImageView(
    this.stock, {
    this.size = 100,
  });

  final StockEntity stock;
  final double size;

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => stock.retrieveImageUrl(size), [stock]);
    final sizeSnapshot =
        useFuture(future.then((value) => value!), initialData: null);
    // nullableではないので不必要
    // if (stock == null) {
    //   // そもそもStockItemがnullだったらNoImage.
    //   return Image.asset(
    //     'assets/images/no_image_gray.png',
    //     width: size,
    //     height: size,
    //   );
    // }
    if (sizeSnapshot.hasError) {
      // エラー処理
      logger.warning('画像読み込みエラー${sizeSnapshot.error}');
      return Image.asset(
        'assets/images/no_image_gray.png',
        width: size,
        height: size,
      );
    }
    if (!sizeSnapshot.hasData || sizeSnapshot.data == null) {
      // 読み込み中はインジケーターを表示
      return SizedBox(
        width: size,
        height: size,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // 非同期で取得したURLから画像を表示
    return UrlImage(
      sizeSnapshot.data,
      width: size,
      height: size,
    );
  }
}
