// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../commons/json_converter/timestamp_converter.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

class RankingField {
  static const userId = 'user_id';
  static const title = 'title';
  static const comment = 'comment';
  static const imageUrl = 'image_url';
  static const thumbnailUrl = 'thumbnail_url';
  static const pinned = 'pinned';
  static const tags = 'tags';
}

@freezed
class Ranking with _$Ranking {
  const factory Ranking({
    @TimestampOrNullConverter() DateTime? createdAt,
    @TimestampOrNullConverter() DateTime? updatedAt,

    /// ランキングタイトル
    @Default('') String title,

    /// ランキングの説明
    @Default('') String description,

    /// ランキングの画像
    String? imageUrl,

    /// ランキングのサムネイル画像
    String? thumbnailUrl,

    /// 優先して表示させたいランキングなら `true`
    @Default(false) bool pinned,

    /// タグリスト
    @Default(<String>[]) List<String> tags,

    /// お勧めタグを表示するか
    @Default(true) bool recommendTagsShowing,
  }) = _Ranking;

  const Ranking._();

  factory Ranking.fromJson(Map<String, Object?> json) =>
      _$RankingFromJson(json);

  /// Functionsでやった方が良いと思う
  List<String> get recommendTags {
    final recommends = <String>[];
    final title = this.title.toLowerCase();
    if (title.contains('ゲーム')) {
      recommends.addAll(['ゲーム', 'Switch', 'PS5', 'Sample', 'Example', 'More']);
    }
    if (title.contains('switch')) {
      recommends.add('Switch');
    }
    if (title.contains('ps5')) {
      recommends.add('PS5');
    }
    if (title.contains('音楽') || title.contains('music')) {
      recommends.add('音楽');
    }
    // 登録済みのものは除外する
    recommends.removeWhere((e) => tags.contains(e));
    return recommends;
  }
}
