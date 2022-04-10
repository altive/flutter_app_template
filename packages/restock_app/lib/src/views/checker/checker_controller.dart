import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/remote_config/remote_config_provider.dart';
import '../../utils/utils.dart';
import 'checker_human_type.dart';
import 'checker_state.dart';

final checkerProvider = StateNotifierProvider<CheckerController, CheckerState>(
  CheckerController.new,
);

class CheckerController extends StateNotifier<CheckerState> {
  // ----- Constructor ----- //
  CheckerController(this._ref) : super(const CheckerState()) {
    getSetList();
  }

  // contextからサービスクラスを取り出す
  // ignore: unused_field
  final Ref _ref;

  /// お勧めストックセットのリストをRemote Configから取得
  Future<void> getSetList() async {
    final remoteConfig = await _ref.read(remoteConfigProvider.future);
    final stockSetList = remoteConfig?.recommendStockSetList;
    logger.finer(stockSetList);
    // 状態更新
    if (mounted) {
      state = state.copyWith(stockSetList: stockSetList);
    }
  }

  // Actions

  /// カウントを増やす
  bool increaseCount({required HumanType type}) {
    switch (type) {
      case HumanType.male:
        if (state.manCount >= 10) {
          return false;
        }
        state = state.copyWith(
          manCount: state.manCount + 1,
        );
        break;
      case HumanType.female:
        if (state.womanCount >= 10) {
          return false;
        }
        state = state.copyWith(
          womanCount: state.womanCount + 1,
        );
        break;
      case HumanType.child:
        if (state.childCount >= 10) {
          return false;
        }
        state = state.copyWith(
          childCount: state.childCount + 1,
        );
        break;
    }
    return true;
  }

  /// カウントを減らす
  bool decreaseCount({required HumanType type}) {
    switch (type) {
      case HumanType.male:
        if (state.manCount <= 0) {
          return false;
        }
        state = state.copyWith(
          manCount: state.manCount - 1,
        );
        break;
      case HumanType.female:
        if (state.womanCount <= 0) {
          return false;
        }
        state = state.copyWith(
          womanCount: state.womanCount - 1,
        );
        break;
      case HumanType.child:
        if (state.childCount <= 0) {
          return false;
        }
        state = state.copyWith(
          childCount: state.childCount - 1,
        );
        break;
    }
    return true;
  }
}
