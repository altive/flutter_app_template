import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/item_image_display.dart';
import '../../utils/utils.dart';
import 'stock_detail_page_controller.dart';

/// 商品の画像をリンク付きで表示
/// 適した大きさの画像を非同期で取得して表示する
class StockDetailImageTile extends HookConsumerWidget {
  const StockDetailImageTile({
    this.imageSize = 200,
  });

  final double imageSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stock = ref.watch(stockForStockDetailProvider);
    return SizedBox(
      width: imageSize,
      height: imageSize,
      child: stock == null
          ? null
          : FutureBuilder<String?>(
              // サイズ指定によって適切なサイズの画像URLを取得
              future: stock.retrieveImageUrl(imageSize),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // エラー処理
                  logger.warning('画像読み込みエラー${snapshot.error}');
                  return Image.asset(
                    'assets/images/no_image_gray.png',
                    width: imageSize,
                    height: imageSize,
                  );
                }
                if (!snapshot.hasData) {
                  // 読み込み中はインジケーターを表示
                  return const Center(child: CircularProgressIndicator());
                }
                return ItemImageDisplay(
                  imageUrl: snapshot.data,
                  pageUrl: stock.amazonUrl,
                  imageSize: imageSize,
                  category: stock.categoryType,
                );
              },
            ),
    );
  }
}
