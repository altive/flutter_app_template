import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/list_section_header.dart';
import '../../common_widgets/loading_indicator.dart';
import 'checker_controller.dart';
import 'checker_input_cell.dart';
import 'checker_result_cell.dart';
import 'checker_state.dart';
import 'kihon_set_cell.dart';
import 'new_label.dart';
import 'stock_set_cell.dart';

/// ユーザーに必要なストック量を計算し、お勧めセットを提示する
class CheckerPage extends HookConsumerWidget {
  // Constructor
  const CheckerPage();

  // Field
  static const String routeName = '/checker';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkerProvider);
    final rice = calculateRice(state);
    final water = calculateWater(state);
    return LoadingIndicator(
      loading: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('ストックチェック')),
        body: SafeArea(
          child: ListView(
            children: [
              const ListSectionHeader(title: '家族の人数を入力して、ストック量を計算してみよう！'),
              const CheckerInputCell(),
              _ListCell(
                child: ResultCell(
                  rice: rice,
                  water: water,
                ),
              ),
              const Divider(height: 1),
              // 無洗米・飲料水の基本セット
              _ListCell(
                child: KihonSetCell(
                  rice: rice,
                  water: water,
                ),
              ),
              if (state.stockSetList != null)
                ...state.stockSetList!.map((stockSet) {
                  // 作成日時と現在日時との差（日数）
                  final createdAtDuration =
                      DateTime.now().difference(stockSet.createdAt!);
                  // 更新日時と現在日時との差（日数）
                  final updatedAtDuration =
                      DateTime.now().difference(stockSet.updatedAt!);
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Column(
                        children: [
                          const Divider(height: 1),
                          _ListCell(child: StockSetCell(stockSet: stockSet)),
                        ],
                      ),
                      // 作成して●日以内なら表示
                      if (createdAtDuration < const Duration(days: 7))
                        const NewLabel(
                          'New !',
                        ),
                      // 更新して●日以内なら表示
                      if (createdAtDuration > const Duration(days: 7) &&
                          updatedAtDuration < const Duration(days: 7))
                        const NewLabel(
                          'Update !',
                        ),
                    ],
                  );
                }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  /// 必要な無洗米の量を計算
  double calculateRice(CheckerState state) {
    return state.manCount * 0.8 +
        state.womanCount * 0.6 +
        state.childCount * 0.5;
  }

  /// 必要な飲料水の量を計算
  int calculateWater(CheckerState state) {
    return (state.manCount + state.womanCount + state.childCount) * 10;
  }
}

class _ListCell extends StatelessWidget {
  const _ListCell({
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).cardColor,
      child: child,
    );
  }
}
