import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/user_device/user_device.dart';
import '../../../gen/strings.g.dart';
import '../../../router/router.dart';

class SettingsPageBody extends HookConsumerWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final i18n = Translations.of(context);
    final userDevice = ref.watch(userDeviceProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            onTap: () => const ThemeSelectionRouteData().go(context),
            title: Text(i18n.settings.page.list.theme.selector.label),
          ),
        ),
        Card(
          child: ListTile(
            onTap: () => const AccountRouteData().go(context),
            title: Text(i18n.settings.page.list.account.label),
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
