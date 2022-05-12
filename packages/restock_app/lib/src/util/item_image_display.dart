import 'dart:io';

import 'package:flutter/material.dart';

import '../common_widgets/amazon_icon.dart';
import '../common_widgets/url_image.dart';
import '../my_stock/my_stock_category.dart';
import 'web_launcher.dart';

/// アイテム画像を表示し、タップで[pageUrl]へ遷移する
/// 画像は`File`である[imageFile]か`URL`である[imageUrl]のどちらかで表示させられる。
class ItemImageDisplay extends StatelessWidget {
  const ItemImageDisplay({
    this.imageFile,
    required this.imageUrl,
    required this.pageUrl,
    this.imageSize = 200,
    this.category,
  });

  final File? imageFile;
  final String? imageUrl;
  final String? pageUrl;
  final double imageSize;
  final MyStockCategory? category;

  @override
  Widget build(BuildContext context) {
    // どちらの画像もnullだった場合
    if (imageFile == null && imageUrl == null) {
      return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Image.asset(
          'assets/images/no_image_gray.png',
          width: imageSize,
          height: imageSize,
        ),
      );
    }
    return GestureDetector(
      onTap: () => launchUrl(pageUrl),
      child: Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Hero(
              tag: 'StockItemImage',
              transitionOnUserGestures: true,
              child: imageFile == null
                  ? UrlImage(
                      imageUrl,
                      width: imageSize,
                      height: imageSize,
                    )
                  : Image.file(
                      imageFile!,
                      width: imageSize,
                      height: imageSize,
                    ),
            ),
            if (category != null)
              Align(
                alignment: Alignment.topRight,
                child: Chip(
                  label: Text(
                    category!.displayLabel,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  backgroundColor: category.color,
                ),
              ),
            if (pageUrl != null) const AmazonIcon(alignment: Alignment.topLeft),
          ],
        ),
      ),
    );
  }
}
