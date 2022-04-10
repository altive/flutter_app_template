import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/revenue/revenue.dart';
import '../../../everyones_stock/everyones_stock_model.dart';
import '../../../everyones_stock/expiration_date_type.dart';
import '../../../my_stock/my_stock_category.dart';
import '../../authenticator/auth_controller.dart';

part 'favorite_item.freezed.dart';
part 'favorite_item.g.dart';

final favoriteItemProvider = StreamProvider.autoDispose((ref) {
  final isProPlanUser = ref.watch(revenueControllerProvider).isSubscriber;
  final user = ref.watch(authControllerProvider);
  if (user == null) {
    return const Stream<List<Document<FavoriteItem>>>.empty();
  }
  return favoritesRef(user.uid).documents((query) {
    if (isProPlanUser) {
      return query
          // 追加順で表示
          .orderBy(TimestampField.createdAt, descending: true);
    } else {
      return query
          // 追加順で表示
          .orderBy(TimestampField.createdAt, descending: true)
          // 無料ユーザーは取得件数制限あり
          .limit(10);
    }
  });
});

@freezed
class FavoriteItem with _$FavoriteItem {
  // データ型を定義
  const factory FavoriteItem({
    /// 作成日時
    @TimestampConverter() DateTime? createdAt,

    /// アイテムの名前
    required String name,

    /// Amazonの商品コード @nullable
    required String? asin,

    /// 商品カテゴリ
    required String category,

    /// 期限の種類
    required int expirationDateTypeInt,

    /// 消費期限 or 賞味期限 @nullable
    @TimestampConverter() DateTime? expirationAt,

    /// Amazonの商品Url @nullable
    required String? amazonUrl,

    /// Amazonの商品画像（小） @nullable
    String? imageUrlSmall,

    /// Amazonの商品画像（中） @nullable
    String? imageUrlMedium,

    /// Amazonの商品画像（大） @nullable
    String? imageUrlLarge,
  }) = _FavoriteItem;

  // カスタムメソッド・Getterを定義するためにプライベートコンストラクタが必要
  const FavoriteItem._();

  // Constructor
  // --------------------------------------------------------------------------

  /// DBから取得したJSON形式から変換する
  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

  /// タイムラインアイテムから生成する
  factory FavoriteItem.fromTimelineItem(EveryonesStockModel item) =>
      FavoriteItem(
        name: item.name,
        asin: item.asin,
        category: item.category,
        expirationDateTypeInt: item.expirationDateTypeInt,
        expirationAt: item.expirationAt,
        amazonUrl: item.amazonUrl,
        imageUrlSmall: item.imageUrlSmall,
        imageUrlMedium: item.imageUrlMedium,
        imageUrlLarge: item.imageUrlLarge,
      );

  /// PAAPIアイテムから生成する
  factory FavoriteItem.fromTPaapiItem(PaapiSearchItem item) => FavoriteItem(
        name: item.displayTitle!,
        asin: item.asin,
        category: item.categoryString!,
        expirationDateTypeInt:
            MyStockCategoryEx.fromString(item.categoryString) ==
                    MyStockCategory.grocery
                ? 0
                : 1,
        amazonUrl: item.detailPageUrl,
        imageUrlSmall: item.smallImageUrl,
        imageUrlMedium: item.mediumImageUrl,
        imageUrlLarge: item.largeImageUrl,
      );

  // ----- Getter ------ //
  /// 期限の種類を数値から型に変換したもの
  ExpirationDateType get expirationDateType {
    return ExpirationDateType.values[expirationDateTypeInt];
  }

  /// カテゴリーの文字列から型に変換する
  MyStockCategory get categoryType => MyStockCategoryEx.fromString(category);

  /// 期限日の表示用文字列
  String? get displayExpirationDate {
    if (expirationAt == null) {
      return null;
    }
    return DateFormat.yMMMEd().format(expirationAt!);
  }

  /// 適切な画像URLを返す
  /// Amazonの画像が保存されていればそれを返す
  /// Amazonの画像URLがなく、写真のパスが保存されていればStorageの写真ダウンロードURLを返す
  Future<String?> retrieveImageUrl(double size) async {
    if (size <= 100) {
      // 画像サイズ（小）を提供
      return imageUrlSmall;
    } else if (size <= 200) {
      // 画像サイズ（中）を提供
      return imageUrlMedium;
    } else {
      // 画像サイズ（大）を提供
      return imageUrlLarge;
    }
  }
}

FavoritesRef favoritesRef(String uid) => FavoritesRef(uid);

class FavoritesRef
    extends CollectionRef<FavoriteItem, FavoriteDoc, FavoriteRef> {
  FavoritesRef(this.uid)
      : super(
          FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection('favorites'),
        );

  final String uid;

  @override
  Map<String, dynamic> encode(FavoriteItem data) {
    return replacingTimestamp(json: data.toJson());
  }

  @override
  FavoriteDoc decode(DocumentSnapshot snapshot, FavoriteRef docRef) {
    return FavoriteDoc(
      docRef,
      FavoriteItem.fromJson(snapshot.data()! as Map<String, Object?>),
    );
  }

  @override
  FavoriteRef docRef(DocumentReference ref) {
    return FavoriteRef(
      ref: ref,
      cRef: this,
    );
  }
}

class FavoriteRef extends DocumentRef<FavoriteItem, FavoriteDoc> {
  const FavoriteRef({required DocumentReference ref, required this.cRef})
      : super(
          ref: ref as DocumentReference<Map<String, Object?>>,
          collectionRef: cRef,
        );
  final FavoritesRef cRef;
}

class FavoriteDoc extends Document<FavoriteItem> {
  const FavoriteDoc(
    this.docRef,
    FavoriteItem entity,
  ) : super(docRef, entity);

  final FavoriteRef docRef;
}
