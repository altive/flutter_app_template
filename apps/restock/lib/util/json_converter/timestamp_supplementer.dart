import 'package:cloud_firestore/cloud_firestore.dart';

/// 変換対象のTimestampField文字列
class TimestampField {
  static const createdAt = 'created_at';
  static const updatedAt = 'updated_at';
}

extension MapExt on Map<String, Object?> {
  /// `createdAt` が null なら `serverTimestamp` を挿入する
  /// `updatedAt` に `serverTimestamp` を挿入する
  Map<String, Object?> suppelementTimestamp() {
    return <String, Object?>{
      ...this,
      if (this[TimestampField.createdAt] == null)
        TimestampField.createdAt: FieldValue.serverTimestamp(),
      TimestampField.updatedAt: FieldValue.serverTimestamp(),
    };
  }
}
