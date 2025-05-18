import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../package_adaptor/authenticator_provider.dart';
import '../firestore_provider.dart';
import '../models/stock_item.dart';

part 'stock_items_state_provider.g.dart';

/// ユーザーの備蓄品データを取得・管理するプロバイダー。
@riverpod
class StockItemsState extends _$StockItemsState {
  @override
  Stream<List<StockItem>?> build() async* {
    final user = await ref.watch(userProvider.future);
    final userId = user?.uid;

    if (userId == null) {
      yield null;
      return;
    }

    yield* ref
        .watch(firestoreProvider)
        .collection(StockItem.collectionPath(userId: userId))
        .withConverter(
          fromFirestore: StockItem.fromFirestore,
          toFirestore: StockItem.toFirestore,
        )
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((s) => s.docs.map((s) => s.data()).nonNulls.toList());
  }

  /// 更新する。
  Future<void> updateStockItem({
    required String stockItemId,
    required bool isRead,
  }) async {
    final user = await ref.read(userProvider.future);
    final userId = user?.uid;
    if (userId == null) {
      return;
    }

    final firestore = ref.read(firestoreProvider);
    final docRef = firestore
        .doc(StockItem.docPath(userId: userId, stockItemId: stockItemId))
        .withConverter(
          fromFirestore: StockItem.fromFirestore,
          toFirestore: StockItem.toFirestore,
        );

    final stockItem = await docRef.get().then((snapshot) => snapshot.data());

    if (stockItem == null) {
      return;
    }

    // 編集。
    final updatedData = stockItem;

    // 更新を反映
    await docRef.update({
      'data': updatedData,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
