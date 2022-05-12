import 'package:flutter/material.dart';

import '../../util/theme/theme_list_view.dart';

class ThemeSelectionPage extends StatelessWidget {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  const ThemeSelectionPage();

  // ----------------------------------------
  // Field
  // ----------------------------------------
  static const String routeName = '/theme-selection';

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('テーマ設定')),
      body: const SafeArea(
        child: ThemeListView(),
      ),
    );
  }
}
