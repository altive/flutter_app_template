import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/image_background.dart';
import 'components/histories_page_app_bar.dart';
import 'components/histories_page_body.dart';

class HistoriesPage extends ConsumerWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageBackground(
      child: CustomScrollView(
        slivers: [
          HistoriesPageAppBar(),
          HistoriesPageBody(),
        ],
      ),
    );
  }
}
