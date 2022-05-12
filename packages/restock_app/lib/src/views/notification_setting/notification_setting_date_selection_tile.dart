import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../util/shared_preferences_service.dart';
import '../../utils/utils.dart';

/// 通知日を選択するためのListTile
/// 現在の選択状態も表示する
class NotificationSettingDateSelectionTile extends StatelessWidget {
  const NotificationSettingDateSelectionTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.date_range),
      title: const Text('通知日'),
      subtitle: const Text('登録済み通知の通知日は変更されません'),
      trailing: _DateDropdownButton(),
    );
  }
}

class _DateDropdownButton extends ConsumerStatefulWidget {
  @override
  __DateDropdownButtonState createState() => __DateDropdownButtonState();
}

class __DateDropdownButtonState extends ConsumerState<_DateDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton<NotificationDate>(
          value: ref
              .watch(sharedPreferencesServiceProvider)
              .getNotificationDuration,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (date) {
            logger.finer('通知日を変更: $date');
            // 何日前に通知するかを変更
            setState(() {
              ref
                  .read(sharedPreferencesServiceProvider)
                  .saveNotificationDuration(days: date.count);
            });
          },
          items: NotificationDate.values.map((date) {
            return DropdownMenuItem(
              value: date,
              child: Text(date.label),
            );
          }).toList(),
        );
      },
    );
  }
}
