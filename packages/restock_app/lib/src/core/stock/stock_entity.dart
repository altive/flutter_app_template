import 'dart:math';

import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../everyones_stock/everyones_stock_model.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import '../../my_stock/my_stock_category.dart';
import '../../util/storage_service.dart/storage_service.dart';
import '../../utils/utils.dart';

part 'stock_entity.freezed.dart';
part 'stock_entity.g.dart';

/// ストックEntityのフィールド名文字列
/// データベースで使われるため、基本的に後から文字列を変更しない
class StockEntityField {
  static const id = 'id';
  static const idNumber = 'idNumber';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const name = 'name';
  static const originalName = 'originalName';
  static const numberOfItems = 'numberOfItems';
  static const asin = 'asin';
  static const itemId = 'itemId';
  static const productCategory = 'category';

  static const expirationAt = 'expirationAt';

  static const stockCategory = 'place';
}

@freezed
class StockName with _$StockName {
  const factory StockName(String value) = _StockName;
}

class StockNameConverter implements JsonConverter<StockName, String> {
  const StockNameConverter();

  @override
  StockName fromJson(String json) => StockName(json);

  @override
  String toJson(StockName object) => object.value;
}

/// ユーザーのストック
@freezed
class StockEntity with _$StockEntity {
  const factory StockEntity({
    /// 古いバージョンのアプリでは `id` を入れていなかった。
    /// そもそも入れなくて良い運用が良さそうだが、現時点では取得時点で補完した上で使用している
    required String? id,

    /// 通知で使用する一位の数列
    required int idNumber,

    /// 作成日時
    @TimestampConverter() DateTime? createdAt,

    /// 更新日時
    @TimestampConverter() DateTime? updatedAt,

    /// アイテムの名前
    @StockNameConverter() required StockName name,

    /// アイテムの名前（Amazon商品の編集されていない名前）
    /// みんなのストックなどの表示に使う @nullable
    String? originalName,

    /// アイテムのストック数
    required double numberOfItems,

    /// Amazonの商品コード @nullable
    required String? asin,

    /// 手動で登録したアイテムのID。複製した場合はこのIDを引き継ぐ @nullable
    required String? itemId,

    /// 商品の種類（食品・その他など）
    /// v2.2.1: ローカルでは `productCategory` に変更
    @JsonKey(name: StockEntityField.productCategory)
        required String productCategory,

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

    /// 商品写真のStorage保存パス（200x200） @nullable
    String? imagePathSmall,

    /// 商品写真のStorage保存パス（400x400） @nullable
    String? imagePathMedium,

    /// 商品写真のStorage保存パス（600x600） @nullable
    String? imagePathLarge,

    /// 商品写真のStorage保存パス（600x600） @nullable
    String? imagePathOriginal,

    /// メモ @nullable
    String? memo,

    /// グループ @nullable
    /// added: v1.9.0
    /// v2.2.1: ローカルでは `stockCategory` に変更
    @JsonKey(name: StockEntityField.stockCategory) String? stockCategory,
  }) = _StockEntity;

  // カスタムメソッド・Getterを定義するために必要
  const StockEntity._();

  // Constructor
  // --------------------------------------------------------------------------

  // Entity と JSONの相互変換メソッドを生成する
  factory StockEntity.fromJson(Map<String, dynamic> json) =>
      _$StockEntityFromJson(json);

  /// Amazon検索結果アイテムからストックアイテムの初期値を作成する
  factory StockEntity.fromSearchedAmazonItem(PaapiSearchItem item) {
    return StockEntity(
      id: const Uuid().v4(),
      idNumber: Random().nextInt(294967296),
      name: StockName(item.displayTitle!),
      originalName: item.displayTitle,
      numberOfItems: 1,
      asin: item.asin,
      itemId: null,
      productCategory: item.categoryString!,
      expirationDateTypeInt:
          MyStockCategoryEx.fromString(item.categoryString) ==
                  MyStockCategory.grocery
              ? 0
              : 1,
      imageUrlSmall: item.smallImageUrl,
      imageUrlMedium: item.mediumImageUrl,
      imageUrlLarge: item.largeImageUrl,
      amazonUrl: item.detailPageUrl,
    );
  }

  /// Timelineアイテムからストックアイテムの初期値を作成する
  factory StockEntity.fromTimelineItem(EveryonesStockModel item) {
    return StockEntity(
      id: const Uuid().v4(),
      idNumber: Random().nextInt(294967296),
      name: StockName(item.name),
      originalName: item.name,
      numberOfItems: item.numberOfItems,
      asin: item.asin,
      itemId: null,
      productCategory: item.category,
      expirationDateTypeInt: item.expirationDateTypeInt,
      imageUrlSmall: item.imageUrlSmall,
      imageUrlMedium: item.imageUrlMedium,
      imageUrlLarge: item.imageUrlLarge,
      amazonUrl: item.amazonUrl,
    );
  }

  /// お気に入りアイテムからストックアイテムの初期値を作成する
  factory StockEntity.fromFavoriteItem(FavoriteItem item) {
    return StockEntity(
      id: const Uuid().v4(),
      idNumber: Random().nextInt(294967296),
      name: StockName(item.name),
      originalName: item.name,
      numberOfItems: 1,
      asin: item.asin,
      itemId: null,
      productCategory: item.category,
      expirationDateTypeInt: item.expirationDateTypeInt,
      imageUrlSmall: item.imageUrlSmall,
      imageUrlMedium: item.imageUrlMedium,
      imageUrlLarge: item.imageUrlLarge,
      amazonUrl: item.amazonUrl,
    );
  }

  /// EntityからJSONに変換し、Timestampを補完する
  Map<String, dynamic> toJsonAndSupplementTimestamp() =>
      supplementTimestamp(json: toJson());

  // ----- Getter ------ //
  /// 期限の種類を数値から型に変換したもの
  ExpirationDateType get expirationDateType {
    return ExpirationDateType.values[expirationDateTypeInt];
  }

  bool get isNonExpiration => expirationDateType == ExpirationDateType.none;

  /// 商品の種類の文字列から型に変換する
  MyStockCategory get categoryType =>
      MyStockCategoryEx.fromString(productCategory);

  /// 期限日の表示用文字列
  String get displayExpirationDate {
    if (expirationAt == null) {
      return '';
    }
    return DateFormat.yMMMEd().format(expirationAt!);
  }

  /// 適切な画像URLを返す
  /// Amazonの画像が保存されていればそれを返す
  /// Amazonの画像URLがなく、写真のパスが保存されていればStorageの写真ダウンロードURLを返す
  Future<String?> retrieveImageUrl(double size) async {
    String? url;
    String? path;

    if (size <= 100) {
      // 画像サイズ（小）を提供
      url = imageUrlSmall;
      path = imagePathSmall;
    } else if (size <= 200) {
      // 画像サイズ（中）を提供
      url = imageUrlMedium;
      path = imagePathMedium;
    } else {
      // 画像サイズ（大）を提供
      url = imageUrlLarge;
      path = imagePathLarge;
    }

    if (url != null) {
      // Amazonの画像が見つかったのでURLを返却する
      return url;
    }

    if (path == null) {
      // Amazon画像も写真パスも見つからなかった場合は諦めてnullを返す
      return null;
    }

    // Storageで写真ダウンロードURLを取得する
    final storage = StorageService();
    final downloadUrl = await storage.downloadStockItemPhoto(path);
    return downloadUrl;
  }
}
