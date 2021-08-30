import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commons/json_converter/timestamp_converter.dart';

part 'ranking_member.freezed.dart';
part 'ranking_member.g.dart';

class RankingMemberField {
  static const ranking = 'ranking';
  static const title = 'title';
  static const comment = 'comment';
  static const imageUrl = 'image_url';
  static const thumbnailUrl = 'thumbnail_url';
}

@freezed
class RankingMember with _$RankingMember {
  const factory RankingMember({
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime updatedAt,

    /// 順位
    required int ranking,

    /// 項目名
    @Default('') String title,

    /// 項目に対するコメント
    @Default('') String comment,

    /// 項目の画像
    String? imageUrl,

    /// 項目のサムネイル画像
    String? thumbnailUrl,
  }) = _RankingMember;

  factory RankingMember.fromJson(Map<String, Object?> json) =>
      _$RankingMemberFromJson(json);
}
