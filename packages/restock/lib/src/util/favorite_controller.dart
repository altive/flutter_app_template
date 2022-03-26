import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/revenue/revenue.dart';
import '../models/authenticator/auth_controller.dart';
import '../models/firestore/favorite_item/favorite_item.dart';

final favoriteProvider = Provider<FavoriteController>((ref) {
  final user = ref.watch(authControllerProvider);
  final revenueState = ref.watch(revenueControllerProvider);
  return FavoriteController(
    ref.read,
    user?.uid,
    revenueState,
  );
});

class FavoriteController {
  FavoriteController(
    this._read,
    this._uid,
    this._revenueState,
  );

  // ignore: unused_field
  final Reader _read;
  late final String? _uid;
  final RevenueState _revenueState;

  /// お気に入りに追加
  Future<String> addFavorite(FavoriteItem item, {required int count}) async {
    if (!_revenueState.isSubscriber && count >= 10) {
      // 非Proユーザーかつ10個以上登録済みの場合は登録できない
      return 'お気に入りは10個までです';
    }
    // ドキュメント作成して追加
    await favoritesRef(_uid!).add(item);
    return 'お気に入りに追加しました';
  }

  /// お気に入りから削除
  Future<String> removeFavorite(String? asin) async {
    // ドキュメントをASINで検索して、一致したものを全て削除
    final documents = await favoritesRef(_uid!).getDocuments(
      (query) => query.where('asin', isEqualTo: asin),
    );
    for (final doc in documents) {
      await doc.ref.delete();
    }
    return 'お気に入りを解除しました';
  }
}
