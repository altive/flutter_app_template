import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/image_background.dart';
import 'components/onetap_page_app_bar.dart';
import 'components/onetap_page_body.dart';

class OnetapPage extends ConsumerWidget {
  const OnetapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageBackground(
      child: CustomScrollView(
        slivers: [
          OnetapPageAppBar(),
          OnetapPageBody(),
        ],
      ),
    );
  }
}
