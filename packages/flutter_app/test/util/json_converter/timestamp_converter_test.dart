import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/util/json_converter/timestamp_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final random = Random();
  late int randomNumber;

  setUp(() {
    // テストごとにランダム値を書き換える
    randomNumber = random.nextInt(1000);
  });

  group('TimestampConverter', () {
    group('fromJson', () {
      test('同じ値を引数に与えた時、TimestampからDateTimeへの変換が成功する', () {
        final expectDate = DateTime.fromMillisecondsSinceEpoch(randomNumber);

        const target = TimestampConverter();
        final targetDate =
            target.fromJson(Timestamp.fromMillisecondsSinceEpoch(randomNumber));

        expect(targetDate, expectDate);
      });

      test('異なる値を引数に与えた時、TimestampからDateTimeへの変換が失敗する', () {
        final expectDate = DateTime.fromMillisecondsSinceEpoch(1000);

        const target = TimestampConverter();
        final targetDate =
            target.fromJson(Timestamp.fromMillisecondsSinceEpoch(999));

        expect(targetDate, isNot(expectDate));
      });
    });

    group('toJson', () {
      test('同じ値を引数に与えた時、DateTimeからTimestampへの変換が成功する', () {
        final expectTimestamp =
            Timestamp.fromMillisecondsSinceEpoch(randomNumber);

        const target = TimestampConverter();
        final targetTimestamp =
            target.toJson(DateTime.fromMillisecondsSinceEpoch(randomNumber));

        expect(targetTimestamp, expectTimestamp);
      });

      test('異なる値を引数に与えた時、DateTimeからTimestampへの変換が成功する', () {
        final expectTimestamp = Timestamp.fromMillisecondsSinceEpoch(1000);

        const target = TimestampConverter();
        final targetTimestamp =
            target.toJson(DateTime.fromMillisecondsSinceEpoch(999));

        expect(targetTimestamp, isNot(expectTimestamp));
      });
    });
  });
}
