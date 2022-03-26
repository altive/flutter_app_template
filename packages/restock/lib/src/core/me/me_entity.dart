import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'me_entity.freezed.dart';
part 'me_entity.g.dart';

class MeEntityField {
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const nickname = 'nickname';
  // MEMO: 最初は「保管場所」という名前だった
  static const groups = 'stockPlaces';
  static const isPrivateMyStock = 'isPrivateMyStock';
}

/// ユーザーの情報（非公開）
@freezed
class MeEntity with _$MeEntity {
  const factory MeEntity({
    /// 作成日時
    @TimestampConverter() DateTime? createdAt,

    /// 更新日時
    @TimestampConverter() DateTime? updatedAt,

    /// ニックネーム
    String? nickname,

    /// ユーザーが作成したグループリスト
    @JsonKey(name: MeEntityField.groups) List<String>? groups,

    /// マイストックを非公開にするか
    bool? isPrivateMyStock,
  }) = _MeEntity;

  // カスタムメソッド・Getterを定義するために必要
  const MeEntity._();

  // DBから取得したJSON形式から変換する
  factory MeEntity.fromJson(Map<String, dynamic> json) =>
      _$MeEntityFromJson(json);
}
