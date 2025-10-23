import 'package:cloud_firestore/cloud_firestore.dart';

/// Timestamp field strings to be converted.
class TimestampField {
  static const createdAt = 'created_at';
  static const updatedAt = 'updated_at';
}

extension MapExt on Map<String, Object?> {
  /// Insert `serverTimestamp` if `createdAt` is null.
  /// Insert `serverTimestamp` into `updatedAt`.
  Map<String, Object?> suppelementTimestamp() {
    return <String, Object?>{
      ...this,
      if (this[TimestampField.createdAt] == null)
        TimestampField.createdAt: FieldValue.serverTimestamp(),
      TimestampField.updatedAt: FieldValue.serverTimestamp(),
    };
  }
}
