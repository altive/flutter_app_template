import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../util/json_converter/json_converter.dart';
import '../../../util/json_converter/timestamp_converter.dart';

part 'ranking.freezed.dart';
part 'ranking.g.dart';

@Collection<Ranking>('rankings')
@Collection<RankingMember>('rankings/*/members')
final rankingsRef = RankingCollectionReference();

@freezed
class Ranking with _$Ranking {
  @allJsonConvertersSerializable
  const factory Ranking({
    DateTime? createdAt,
    DateTime? updatedAt,

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
  factory Ranking.fromJson(Map<String, Object?> json) =>
      _$RankingFromJson(json);

  const Ranking._();

  static const userIdField = 'user_id';
  static const titleField = 'title';
  static const commentField = 'comment';
  static const imageUrlField = 'image_url';
  static const thumbnailUrlField = 'thumbnail_url';
  static const pinnedField = 'pinned';
  static const tagsField = 'tags';

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

@freezed
class RankingMember with _$RankingMember {
  @allJsonConvertersSerializable
  const factory RankingMember({
    DateTime? createdAt,
    DateTime? updatedAt,

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

  const RankingMember._();

  static const orderField = 'order';
  static const titleField = 'title';
  static const commentField = 'comment';
  static const imageUrlField = 'image_url';
  static const thumbnailUrlField = 'thumbnail_url';
}
