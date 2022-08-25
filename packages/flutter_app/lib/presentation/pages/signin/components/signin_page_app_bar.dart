import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class SigninPageAppBar extends StatelessWidget {
  const SigninPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      expandedHeight: 280,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Flutter App Template'),
        background: Assets.sampleImages.cats.image(
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
