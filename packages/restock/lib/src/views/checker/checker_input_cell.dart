import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../util/device_size_checker.dart';
import 'checker_controller.dart';
import 'checker_human_type.dart';
import 'checker_state.dart';

/// 家族の人数を入力するセル
class CheckerInputCell extends StatelessWidget {
  const CheckerInputCell({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: HumanType.values.map((e) => HumanTypeBox(type: e)).toList(),
      ),
    );
  }
}

/// 人間タイプごとに人数を表示して増減できる
class HumanTypeBox extends HookWidget {
  const HumanTypeBox({
    Key? key,
    required this.type,
  }) : super(key: key);

  final HumanType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceSize = useProvider(deviceSizeProvider(MediaQuery.of(context)));
    final state = useProvider(checkerProvider);
    final currentCount = () {
      switch (type) {
        case HumanType.male:
          return state.manCount;
        case HumanType.female:
          return state.womanCount;
        case HumanType.child:
          return state.childCount;
      }
    }();
    return Container(
      padding: deviceSize.isSmallPhone
          ? EdgeInsets.zero
          : const EdgeInsets.fromLTRB(8, 8, 8, 0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: deviceSize.isSmallPhone
            ? null
            : const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                type.label!,
                style: theme.textTheme.headline6,
              ),
              Icon(
                getIconData(state: state),
                size: 32,
                color: currentCount == 0
                    ? theme.hintColor
                    : theme.colorScheme.primary,
              ),
              const Text('人'),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(MdiIcons.plusCircle),
                color: Theme.of(context).colorScheme.primary,
                onPressed:
                    currentCount > 9 ? null : () => didTapPlusButton(context),
              ),
              IconButton(
                icon: const Icon(MdiIcons.minusCircle),
                color: Theme.of(context).colorScheme.secondary,
                onPressed:
                    currentCount < 1 ? null : () => didTapMinusButton(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// カウントに対応した番号アイコン
  IconData? getIconData({required CheckerState state}) {
    int? count;
    switch (type) {
      case HumanType.male:
        count = state.manCount;
        break;
      case HumanType.female:
        count = state.womanCount;
        break;
      case HumanType.child:
        count = state.childCount;
        break;
    }
    return MdiIcons.fromString('numeric${count}Circle');
  }

  /// プラスボタンが押された
  void didTapPlusButton(BuildContext context) {
    final isSucceeded =
        context.read(checkerProvider.notifier).increaseCount(type: type);
    if (isSucceeded) {
      HapticFeedback.selectionClick();
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('10人が最大です')));
    }
  }

  /// マイナスボタンが押された
  void didTapMinusButton(BuildContext context) {
    final isSucceeded =
        context.read(checkerProvider.notifier).decreaseCount(type: type);
    if (isSucceeded) {
      HapticFeedback.selectionClick();
    } else {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(content: Text('0人以下には減らせません')));
    }
  }
}
