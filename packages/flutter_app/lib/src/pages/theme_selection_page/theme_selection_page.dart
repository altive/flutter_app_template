import 'package:flutter/material.dart';

import 'components/theme_selection_page_app_bar.dart';
import 'components/theme_selection_page_body.dart';

class ThemeSelectionPage extends StatelessWidget {
  const ThemeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ThemeSelectionPageAppBar(),
      body: ThemeSelectionPageBody(),
    );
  }
}
