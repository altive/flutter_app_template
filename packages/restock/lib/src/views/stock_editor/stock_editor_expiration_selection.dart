import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../util/device_size_checker.dart';
import '../../utils/utils.dart';
import 'stock_editor_controller.dart';

/// 期限の種類を選択する
class StockEditorExpirationSelection extends HookWidget {
  const StockEditorExpirationSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final expirationDateType =
        useProvider(stockEditorPageControllerProvider).expirationDateType;
    final deviceSize = useProvider(deviceSizeProvider(MediaQuery.of(context)));

    return ColoredBox(
      color: theme.backgroundColor,
      child: ListTile(
        dense: true,
        leading: deviceSize.isSmallPhone
            ? null
            : Text(
                '期限',
                style: theme.textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
        trailing: CupertinoSlidingSegmentedControl<ExpirationDateType>(
          padding: EdgeInsets.zero,
          groupValue: expirationDateType,
          children: {
            for (final dateType in ExpirationDateType.values)
              dateType: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Text(dateType.label!),
              ),
          },
          onValueChanged: (selectedType) {
            logger.finest('Changed to $selectedType');
            context
                .read(stockEditorPageControllerProvider.notifier)
                .changeExpirationDateType(selectedType!);
          },
        ),
      ),
    );
  }
}
