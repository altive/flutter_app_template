import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.emptyView,
  }) : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final Widget? emptyView;

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    if (imageUrl == null) {
      return emptyView ?? const SizedBox();
    }
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: imageUrl,
        placeholder: (context, label) => const SizedBox(),
      ),
    );
  }
}
