import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../utils/utils.dart';
import 'stock_entity.dart';

/// ストックのリポジトリを提供
final stockRepositoryProvider = Provider<StockRepository?>((ref) {
  final user = ref.watch(authControllerProvider);
  if (user == null) {
    return null;
  }
  return StockRepository(ref.read, user);
});

/// ストックリストのStreamを提供
final stockEntityListStreamProvider = StreamProvider<List<StockEntity>>((ref) {
  final repo = ref.watch(stockRepositoryProvider);
  if (repo == null) {
    return const Stream.empty();
  }
  return repo.streamList();
});

/// ストックリストを提供
final stockEntityListProvider = Provider<List<StockEntity>?>((ref) {
  return ref.watch(stockEntityListStreamProvider).value;
});

/// 単一ストックのStreamを提供
final stockEntityDetailStreamProvider =
    StreamProvider.family<StockEntity?, String>((ref, id) {
  final repository = ref.watch(stockRepositoryProvider);
  if (repository == null) {
    return const Stream.empty();
  }
  return repository.stream(id);
});

/// 単一ストックを提供
final stockEntityDetailProvider =
    Provider.family<StockEntity?, String>((ref, id) {
  final asyncValue = ref.watch(stockEntityDetailStreamProvider(id));
  return asyncValue.value;
});

/// ASINで絞り込んだストックリストのStreamを提供
final stockEntityFilteredAsinListStreamProvider =
    StreamProvider.family<List<StockEntity?>, String>((ref, asin) {
  final repository = ref.watch(stockRepositoryProvider);
  if (repository == null) {
    return const Stream.empty();
  }
  return repository.streamListFilteredAsin(asin);
});

/// ASINで絞り込んだストックリストを提供
final stockEntityFilteredAsinListProvider =
    Provider.family<List<StockEntity?>?, String>((ref, asin) {
  final asyncValue = ref.watch(stockEntityFilteredAsinListStreamProvider(asin));
  final data = asyncValue.value;
  return data;
});

/// Meのリポジトリ
class StockRepository {
  StockRepository(this._read, this._user);

  // ignore: unused_field
  final Reader _read;
  final User _user;

  final firestore = FirebaseFirestore.instance;
  // MEMO: late を使ってfinalにしたい
  CollectionReference get collectionRef =>
      firestore.collection('users').doc(_user.uid).collection('stockItems');

  /// ストックリストのStreamを返す。任意で並び替えするField名を指定可能
  Stream<List<StockEntity>> streamList({String? orderByField}) {
    final snapshots = orderByField == null
        ? collectionRef.snapshots()
        : collectionRef.orderBy(StockEntityField.expirationAt).snapshots();
    return snapshots.map(
      (e) => e.docs.map((e) {
        return StockEntity.fromJson(e.data()! as Map<String, Object?>).copyWith(
          id: e.id, // 古いストックはIDをフィールドに保存していないため
        );
      }).toList(),
    );
  }

  /// ASINで絞り込んだストックリストのStreamを返す。
  Stream<List<StockEntity?>> streamListFilteredAsin(String asin) {
    final snapshots =
        collectionRef.where(StockEntityField.asin, isEqualTo: asin).snapshots();
    return snapshots.map(
      (e) => e.docs.map((e) {
        return StockEntity.fromJson(e.data()! as Map<String, Object?>).copyWith(
          id: e.id, // 古いストックはIDをフィールドに保存していないため
        );
      }).toList(),
    );
  }

  /// 単一ストックのStreamを返す
  Stream<StockEntity?> stream(String id) {
    return collectionRef.doc(id).snapshots().map(
          (e) =>
              StockEntity.fromJson(e.data()! as Map<String, Object?>).copyWith(
            id: e.id, // 古いストックはIDをフィールドに保存していないため
          ),
        );
  }

  /// 単一ストックを非同期で取得する
  Future<StockEntity> fetch(String id) async {
    final document = await collectionRef.doc(id).get();
    return StockEntity.fromJson(document.data()! as Map<String, Object?>);
  }

  /// EntityをFirestoreに保存し、そのDocument IDを返却する
  Future<String> add(StockEntity entity) async {
    final docRef = collectionRef.doc(entity.id);
    await docRef.set(entity.toJsonAndSupplementTimestamp());
    return docRef.id;
  }

  Future<void> delete(String? id) async {
    return collectionRef.doc(id).delete();
  }

  /// ストックの個数を指定数分増やす
  /// [value]はプラスの値で指定する
  Future<void> increaseNumberOfItems(
    String? id, {
    required int value,
  }) async {
    return collectionRef.doc(id).update(
          updateTimestamp(
            json: <String, Object>{
              StockEntityField.numberOfItems: FieldValue.increment(value),
            },
          ),
        );
  }

  /// ストックの個数を指定数分減らす
  /// [value]はプラスの値で指定する
  Future<void> decreaseNumberOfItems(
    String? id, {
    required int value,
  }) async {
    assert(!value.isNegative);
    return increaseNumberOfItems(id, value: -value);
  }

  /// ストックの個数を0にする
  Future<void> reduceItemToZero(String? id) async {
    return collectionRef.doc(id).update(<String, Object>{
      StockEntityField.updatedAt: FieldValue.serverTimestamp(),
      StockEntityField.numberOfItems: 0,
    });
  }

  /// 新しいEntityで更新する
  /// `updatedAt` も同時に更新される
  Future<void> update(StockEntity entity) async {
    return collectionRef
        .doc(entity.id)
        .update(entity.toJsonAndSupplementTimestamp());
  }

  // Future<void> updateWith(
  //   String id, {
  //   String name,
  //   double numberOfItems,
  //   int expirationDateTypeInt,
  //   DateTime expirationAt,
  //   String productCategory,
  //   String memo,
  //   String stockCategory,
  // }) async {
  // return collectionRef.doc(id).update(updateTimestamp(json: <String, Object>{
  //         //
  //         if (name != null) StockEntityField.name: name,
  //         if (numberOfItems != null)
  //           StockEntityField.numberOfItems: numberOfItems,
  //         if (name != null) StockEntityField.name: name,
  //         if (name != null) StockEntityField.name: name,
  //         if (name != null) StockEntityField.name: name,
  //         if (name != null) StockEntityField.name: name,
  //         if (name != null) StockEntityField.name: name,
  //       }));
  // }
}
