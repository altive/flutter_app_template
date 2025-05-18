import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../converters/date_time_timestamp_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// ユーザーコレクションのドキュメントデータ。
@freezed
sealed class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String displayName,
    String? photoUrl,
    @DateTimeTimestampConverter() required DateTime createdAt,
    @DateTimeTimestampConverter() required DateTime updatedAt,
    @Default(false) bool isPremium,
    @Default({}) Map<String, dynamic> preferences,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

  static String collectionPath() => 'users';

  static String docPath({required String userId}) =>
      '${collectionPath()}/$userId';

  static User? fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return data == null ? null : User.fromJson(data);
  }

  static Map<String, Object?> toFirestore(User? user, SetOptions? options) {
    if (user == null) {
      return {};
    }
    final json = user.toJson();
    final createdAt = json['createdAt'];
    if (createdAt == null) {
      json['createdAt'] = FieldValue.serverTimestamp();
    }
    json['updatedAt'] = FieldValue.serverTimestamp();
    return json;
  }
}
