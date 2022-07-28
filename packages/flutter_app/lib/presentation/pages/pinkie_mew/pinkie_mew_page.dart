import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/pinkie_mew_page_app_bar.dart';
import 'components/pinkie_mew_page_body.dart';

class PinkieMewPage extends HookConsumerWidget {
  const PinkieMewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: PinkieMewPageAppBar(),
      body: PinkieMewPageBody(),
    );
  }
}
