import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/new_onetap_log_page_app_bar.dart';
import 'components/new_onetap_log_page_body.dart';

class NewOnetapLogPage extends ConsumerWidget {
  const NewOnetapLogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: NewOnetapLogPageAppBar(),
      body: NewOnetapLogPageBody(),
    );
  }
}
