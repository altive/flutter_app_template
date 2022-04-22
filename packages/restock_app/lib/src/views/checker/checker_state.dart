import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/remote_config/recommend_stock_set_parameter.dart';

part 'checker_state.freezed.dart';

@freezed
class CheckerState with _$CheckerState {
  const factory CheckerState({
    // 読み込み中かどうか
    @Default(false) bool loading,
    @Default(0) int manCount,
    @Default(0) int womanCount,
    @Default(0) int childCount,
    List<RecommendStockSet>? stockSetList,
  }) = _CheckerState;
}
