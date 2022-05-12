import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/utils.dart';

class UrlImage extends StatelessWidget {
  const UrlImage(
    this.url, {
    this.width = 200,
    this.height = 200,
  });

  final String? url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return Image.asset(
        'assets/images/no_image_gray.png',
        width: width,
        height: height,
      );
    }
    return ExtendedImage.network(
      url!,
      width: width,
      height: height,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.failed:
            logger.warning('画像表示に失敗: $url');
            return GestureDetector(
              // タップで再読み込み
              onTap: () => state.reLoadImage(),
              child: Image.asset(
                'assets/images/no_image_gray.png',
                width: width,
                height: height,
              ),
            );
          case LoadState.loading:
            return null;
          case LoadState.completed:
            return null;
        }
      },
    );
  }
}
