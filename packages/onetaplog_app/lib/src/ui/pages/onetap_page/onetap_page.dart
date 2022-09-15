import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/onetap_page_app_bar.dart';
import 'components/onetap_page_body.dart';

class OnetapPage extends ConsumerWidget {
  const OnetapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: OnetapPageAppBar(),
      body: SafeArea(
        child: OnetapPageBody(),
      ),
    );
  }
}
