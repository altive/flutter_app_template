import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

/// JSONからEntityを作成するとき、[Timestamp]を[DateTime]に変換する
/// EntityからJSONを作成するとき、[DateTime]を[Timestamp]に変換する
class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}

/// JSONからEntityを作成するとき、[String]を[DateTime]に変換する
/// EntityからJSONを作成するとき、[DateTime]を[String]に変換する
class ISO8601Converter implements JsonConverter<DateTime?, String?> {
  const ISO8601Converter();

  @override
  DateTime? fromJson(String? json) =>
      json == null ? null : DateTime?.parse(json);

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}

/// 変換対象のTimestampField文字列
class TimestampField {
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
}

/// `createdAt` が null なら `serverTimestamp` を挿入する
/// `updatedAt` に `serverTimestamp` を挿入する
Map<String, dynamic> supplementTimestamp({
  required Map<String, dynamic> json,
}) =>
    <String, dynamic>{
      ...json,
      if (json[TimestampField.createdAt] == null)
        TimestampField.createdAt: FieldValue.serverTimestamp(),
      TimestampField.updatedAt: FieldValue.serverTimestamp(),
    };

/// `updatedAt` に `serverTimestamp` を挿入する
Map<String, dynamic> updateTimestamp({
  required Map<String, dynamic> json,
}) =>
    <String, dynamic>{
      ...json,
      TimestampField.updatedAt: FieldValue.serverTimestamp(),
    };

DateTime? parseTimestamp({
  required Map<String, dynamic> json,
  required String key,
}) {
  return (json[key] as Timestamp?)?.toDate();
}
