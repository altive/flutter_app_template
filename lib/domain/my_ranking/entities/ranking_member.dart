import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commons/json_converter/timestamp_converter.dart';

part 'ranking_member.freezed.dart';
part 'ranking_member.g.dart';

class RankingMemberField {
  static const order = 'order';
  static const title = 'title';
  static const comment = 'comment';
  static const imageUrl = 'image_url';
  static const thumbnailUrl = 'thumbnail_url';
}

@freezed
class RankingMember with _$RankingMember {
  const factory RankingMember({
    @TimestampOrNullConverter() DateTime? createdAt,
    @TimestampOrNullConverter() DateTime? updatedAt,

    /// 順番
    required double order,

    /// 項目名
    required String title,

    /// 項目に対するコメント
    @Default('') String description,

    /// 項目の画像
    String? imageUrl,

    /// 項目のサムネイル画像
    String? thumbnailUrl,
  }) = _RankingMember;

  factory RankingMember.fromJson(Map<String, Object?> json) =>
      _$RankingMemberFromJson(json);
}
