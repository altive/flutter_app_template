import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/user_device/user_device.dart';
import '../../../router/router.dart';
import '../../../util/localizer/localizer.dart';

class SettingsPageBody extends HookConsumerWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = L10n.of(context);
    final userDevice = ref.watch(userDeviceProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            onTap: () => const ThemeSelectionRouteData().go(context),
            title: Text(l10n.settingsPageListThemeSelectorLabel),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => const AccountRouteData().go(context),
            title: Text(l10n.settingsPageListAccountLabel),
          ),
        ),
        ListTile(
          title: Text(userDevice.name),
          subtitle: Text('${userDevice.osName} ${userDevice.osVersion}'),
        ),
      ],
    );
  }
}
