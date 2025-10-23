import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/util/json_converter/timestamp_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final random = Random();
  late int randomNumber;

  setUp(() {
    // Generate a new random value for each test
    randomNumber = random.nextInt(1000);
  });

  group('TimestampConverter', () {
    group('fromJson', () {
      test(
        'Successfully converts from Timestamp to DateTime with same value',
        () {
        final expectDate = DateTime.fromMillisecondsSinceEpoch(randomNumber);

        const target = TimestampConverter();
        final targetDate = target.fromJson(
          Timestamp.fromMillisecondsSinceEpoch(randomNumber),
        );

        expect(targetDate, expectDate);
      });

      test(
        'Fails to convert from Timestamp to DateTime with different value',
        () {
        final expectDate = DateTime.fromMillisecondsSinceEpoch(1000);

        const target = TimestampConverter();
        final targetDate = target.fromJson(
          Timestamp.fromMillisecondsSinceEpoch(999),
        );

        expect(targetDate, isNot(expectDate));
      });
    });

    group('toJson', () {
      test(
        'Successfully converts from DateTime to Timestamp with same value',
        () {
        final expectTimestamp = Timestamp.fromMillisecondsSinceEpoch(
          randomNumber,
        );

        const target = TimestampConverter();
        final targetTimestamp = target.toJson(
          DateTime.fromMillisecondsSinceEpoch(randomNumber),
        );

        expect(targetTimestamp, expectTimestamp);
      });

      test(
        'Fails to convert from DateTime to Timestamp with different value',
        () {
        final expectTimestamp = Timestamp.fromMillisecondsSinceEpoch(1000);

        const target = TimestampConverter();
        final targetTimestamp = target.toJson(
          DateTime.fromMillisecondsSinceEpoch(999),
        );

        expect(targetTimestamp, isNot(expectTimestamp));
      });
    });
  });
}
