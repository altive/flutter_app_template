import 'package:flutter/material.dart';

import 'components/app_info_app_bar.dart';
import 'components/app_info_body.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppInfoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: AppInfoBody(),
        ),
      ),
    );
  }
}
