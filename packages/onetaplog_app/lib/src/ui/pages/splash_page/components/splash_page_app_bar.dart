import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SplashPageAppBar({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SliverAppBar.medium(
      title: Shimmer.fromColors(
        baseColor: colorScheme.primary,
        highlightColor: colorScheme.secondary,
        child: const Text('One Taps'),
      ),
    );
  }
}
