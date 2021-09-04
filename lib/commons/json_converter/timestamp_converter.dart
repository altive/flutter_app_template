import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class TimestampOrNullConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampOrNullConverter();

  @override
  DateTime? fromJson(Timestamp? json) => json?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}
