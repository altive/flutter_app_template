import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/me/me.dart';

/// ストック保管場所ページのViewModel
final placeEditorPageProvider =
    StateNotifierProvider<PlaceEditorPageController, bool>(
  PlaceEditorPageController.new,
);

class PlaceEditorPageController extends StateNotifier<bool> {
  // ----- Constructor ----- //
  PlaceEditorPageController(this._ref) : super(false);

  final Ref _ref;

  MeRepository? get _meRepository => _ref.read(meRepositoryProvider);

  /// 新しいリストで保管場所を上書き
  void updateCategories(List<String> categories) {
    _meRepository?.updateGroups(categories);
  }

  /// 指定した保管場所を削除
  void removeCategory(String category) {
    _meRepository?.removeGroup(category);
  }

  /// 保管場所を末尾に追加
  void unionPlace(String category) {
    _meRepository?.unionGroup(category);
  }
}
