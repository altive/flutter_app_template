import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../my_stock/my_stock_category.dart';
import 'expiration_date_type.dart';

part 'everyones_stock_model.freezed.dart';
part 'everyones_stock_model.g.dart';

@freezed
class EveryonesStockModel with _$EveryonesStockModel {
  @Assert('name.length > 0', 'name cannot be empty')
  // データ型を定義
  const factory EveryonesStockModel({
    /// 作成日時
    @TimestampConverter() DateTime? createdAt,

    /// アイテムの名前
    required String name,

    /// アイテムのストック数
    required double numberOfItems,

    /// Amazonの商品コード @nullable
    required String asin,

    /// 商品カテゴリ
    required String category,

    /// 期限の種類
    required int expirationDateTypeInt,

    /// 消費期限 or 賞味期限 @nullable
    @TimestampConverter() DateTime? expirationAt,

    /// Amazonの商品Url @nullable
    required String amazonUrl,

    /// Amazonの商品画像（小） @nullable
    String? imageUrlSmall,

    /// Amazonの商品画像（中） @nullable
    String? imageUrlMedium,

    /// Amazonの商品画像（大） @nullable
    String? imageUrlLarge,

    /// ニックネーム @nullable
    required String nickname,
  }) = _EveryonesStockModel;

  // カスタムメソッド・Getterを定義するためにプライベートコンストラクタが必要
  const EveryonesStockModel._();

  // Constructor
  // --------------------------------------------------------------------------

  /// DBから取得したJSON形式から変換する
  factory EveryonesStockModel.fromJson(Map<String, dynamic> json) =>
      _$EveryonesStockModelFromJson(json);

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

final everyonesStocksRef = EveryonesStocksRef();

class EveryonesStocksRef extends CollectionRef<EveryonesStockModel,
    EveryonesStockDoc, EveryonesStockRef> {
  EveryonesStocksRef()
      : super(FirebaseFirestore.instance.collection('timeline'));

  @override
  Map<String, dynamic> encode(EveryonesStockModel data) {
    return replacingTimestamp(json: data.toJson());
  }

  @override
  EveryonesStockDoc decode(
    DocumentSnapshot snapshot,
    EveryonesStockRef docRef,
  ) {
    return EveryonesStockDoc(
      docRef,
      EveryonesStockModel.fromJson(snapshot.data()! as Map<String, Object?>),
    );
  }

  @override
  EveryonesStockRef docRef(DocumentReference<Map<String, dynamic>> ref) {
    return EveryonesStockRef(
      ref: ref,
      cRef: this,
    );
  }
}

class EveryonesStockRef
    extends DocumentRef<EveryonesStockModel, EveryonesStockDoc> {
  const EveryonesStockRef({
    required super.ref,
    required this.cRef,
  }) : super(
          collectionRef: cRef,
        );
  final EveryonesStocksRef cRef;
}

class EveryonesStockDoc extends Document<EveryonesStockModel> {
  const EveryonesStockDoc(
    this.docRef,
    EveryonesStockModel entity,
  ) : super(docRef, entity);

  final EveryonesStockRef docRef;
}
