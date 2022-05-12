import 'package:flutter/material.dart';

import 'notification_setting_date_selection_tile.dart';
import 'notification_setting_schedule_tile.dart';
import 'notification_setting_time_selection_tile.dart';

class NotificationSettingPage extends StatelessWidget {
  // Constructor
  // ----------------------------------
  const NotificationSettingPage();

  // Field
  // ----------------------------------------
  static const String routeName = '/notification-setting';

  // Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('通知の設定')),
      body: SafeArea(
        child: ListView(
          children: const [
            _ContainerTile(child: NotificationSettingScheduleTile()),
            Divider(height: 1),
            _ContainerTile(child: NotificationSettingDateSelectionTile()),
            Divider(height: 1),
            _ContainerTile(child: NotificationSettingTimeSelectionTile()),
          ],
        ),
      ),
    );
  }
}

/// 共通で使うタイル設定
class _ContainerTile extends StatelessWidget {
  const _ContainerTile({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }
}
