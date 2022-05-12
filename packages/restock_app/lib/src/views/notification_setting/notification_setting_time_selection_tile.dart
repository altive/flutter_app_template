import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../util/shared_preferences_service.dart';
import '../../utils/utils.dart';

/// 通知の時刻を設定するためのListTile
/// 現在の選択状態も表示する
class NotificationSettingTimeSelectionTile extends ConsumerStatefulWidget {
  const NotificationSettingTimeSelectionTile();

  @override
  _NotificationSettingTimeSelectionTileState createState() =>
      _NotificationSettingTimeSelectionTileState();
}

class _NotificationSettingTimeSelectionTileState
    extends ConsumerState<NotificationSettingTimeSelectionTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedTime = ref
            .watch(sharedPreferencesServiceProvider)
            .getNotificationTimeSetting;
        return ListTile(
          onTap: () => _updateNotificationTime(
            ref: ref,
            context: context,
            initialTime: selectedTime,
          ),
          leading: const Icon(Icons.access_time),
          title: const Text('通知の時刻'),
          subtitle: const Text('登録済み通知の時刻は変更されません'),
          trailing: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              FittedBox(child: Text(selectedTime.format(context))),
              const FittedBox(child: Icon(Icons.arrow_drop_down)),
            ],
          ),
        );
      },
    );
  }

  /// 通知する時刻を変更
  Future<void> _updateNotificationTime({
    required WidgetRef ref,
    required BuildContext context,
    required TimeOfDay initialTime,
  }) async {
    final result = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (result == null) {
      // キャンセルの時
      return;
    }
    logger.finer('通知時刻設定を変更: $result');
    await ref
        .read(sharedPreferencesServiceProvider)
        .saveNotificationTimeSetting(timeOfDay: result);
    setState(() {});
  }
}
