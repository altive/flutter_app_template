import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commons/json_converter/timestamp_converter.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

class RankingField {
  static const title = 'title';
  static const comment = 'comment';
  static const imageUrl = 'image_url';
  static const thumbnailUrl = 'thumbnail_url';
}

@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,

    /// ランキングタイトル
    @Default('') String title,

    /// ランキングに対するコメント
    @Default('') String comment,

    /// ランキングの画像
    String? imageUrl,

    /// ランキングのサムネイル画像
    String? thumbnailUrl,
  }) = _Ranking;

  factory Ranking.fromJson(Map<String, Object?> json) =>
      _$RankingFromJson(json);
}
