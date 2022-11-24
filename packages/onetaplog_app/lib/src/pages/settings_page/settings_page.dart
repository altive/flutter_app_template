import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/image_background.dart';
import 'components/settings_page_app_bar.dart';
import 'components/settings_page_body.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ImageBackground(
      child: CustomScrollView(
        slivers: [
          SettingsPageAppBar(),
          SettingsPageBody(),
        ],
      ),
    );
  }
}
