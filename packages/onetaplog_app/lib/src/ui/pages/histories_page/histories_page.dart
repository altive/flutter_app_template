import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/histories_page_app_bar.dart';
import 'components/histories_page_body.dart';

class HistoriesPage extends ConsumerWidget {
  const HistoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: HistoriesPageAppBar(),
      body: HistoriesPageBody(),
    );
  }
}
