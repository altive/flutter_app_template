import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? value) => value?.toDate();

  @override
  Timestamp? toJson(DateTime? object) =>
      object != null ? Timestamp.fromDate(object) : null;
}
