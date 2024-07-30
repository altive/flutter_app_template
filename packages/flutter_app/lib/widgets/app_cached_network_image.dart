import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../package_adaptor/tracker_provider.dart';

/// [CachedNetworkImage]'s wrapper widget.
class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.emptyView,
    this.fit = BoxFit.cover,
    this.cacheKey,
  }) : assert(imageUrl != null || emptyView != null);

  final String? imageUrl;
  final Widget? emptyView;
  final BoxFit fit;
  final String? cacheKey;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final imageUrl = this.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      if (emptyView != null) {
        return emptyView!;
      }
      return Icon(
        Icons.error,
        color: colorScheme.error,
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      progressIndicatorBuilder: (_, __, progress) {
        return Center(
          child: CircularProgressIndicator.adaptive(
            value: progress.progress,
          ),
        );
      },
      cacheKey: cacheKey,
      errorWidget: (context, url, error) {
        // When an image cannot be displayed due to an error,
        // display an icon instead of a blank white display
        return HookConsumer(
          builder: (context, ref, child) {
            useEffect(() {
              // Track a error.
              final tracker = ref.read(trackerProvider);
              unawaited(tracker.recordError(error, StackTrace.current));
              return;
            });
            return Icon(
              Icons.error,
              color: colorScheme.outline,
            );
          },
        );
      },
    );
  }
}
