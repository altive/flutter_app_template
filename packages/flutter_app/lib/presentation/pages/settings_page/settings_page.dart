import 'package:flutter/material.dart';

import 'components/settings_page_app_bar.dart';
import 'components/settings_page_body.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SettingsPageAppBar(),
      body: SettingsPageBody(),
    );
  }
}
