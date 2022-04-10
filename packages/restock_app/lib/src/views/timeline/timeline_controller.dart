import 'package:collection/collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../everyones_stock/everyones_stock_model.dart';
import 'timeline_state.dart';

final timelineProvider =
    StateNotifierProvider.autoDispose<TimelineController, TimelineState>((ref) {
  return TimelineController(ref);
});

class TimelineController extends StateNotifier<TimelineState> {
  // ----- Constructor ----- //
  TimelineController(this._ref) : super(const TimelineState()) {
    loadItems();
  }

  // ignore: unused_field
  final Ref _ref;

  // ----- Functions ----- //

  /// タイムラインアイテムを取得する
  Future<void> loadItems() async {
    final value = await everyonesStocksRef.getDocuments(
      (query) => query.orderBy('createdAt', descending: true).limit(20),
    );
    state = state.copyWith(
      displayItems: value.map((e) => e.entity).whereNotNull().toList(),
    );
  }
}
