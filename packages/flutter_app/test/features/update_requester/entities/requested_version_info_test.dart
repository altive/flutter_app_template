import 'package:flutter_app/features/update_requester/entities/requested_version_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  // Date assuming Japan time
  final date = DateTime(2018, 4, 4);
  // Time offset considering Japan Standard Time
  const jstOffset = Duration(hours: 9);
  // Convert to UTC considering JST and execution environment's TimeZone
  final enabledAt = date.subtract(jstOffset).add(date.timeZoneOffset).toUtc();

  group('RequestedVersionInfo', () {
    group('fromJson', () {
      test(
        'When given the same values, objects created by constructor and '
        'fromJson are identical',
        () {
          final entity = RequestedVersionInfo(
            requiredVersion: '1.1.0',
            canCancel: true,
            enabledAt: enabledAt,
          );
          final target = RequestedVersionInfo.fromJson(<String, Object?>{
            'required_version': '1.1.0',
            'can_cancel': true,
            'enabled_at': enabledAt.toIso8601String(),
          });
          expect(target.enabledAt.timeZoneName, 'UTC');
          expect(target, entity);
        },
      );

      test(
        'Even when enabled_at is specified in JST, objects created by '
        'constructor and fromJson are identical',
        () {
          final entity = RequestedVersionInfo(
            requiredVersion: '123.999.195',
            canCancel: true,
            enabledAt: enabledAt,
          );
          final target = RequestedVersionInfo.fromJson(<String, Object?>{
            'required_version': '123.999.195',
            'can_cancel': true,
            'enabled_at': '2018-04-04T00:00+09:00',
          });
          expect(target, entity);
        },
      );

      test(
        'Exception is thrown when date string cannot be converted to DateTime',
        () {
          expect(
            () => RequestedVersionInfo.fromJson(<String, Object?>{
              'required_version': '1.0.0',
              'can_cancel': true,
              'enabled_at': '2018年4月4日',
            }),
            throwsA(isA<CheckedFromJsonException>()),
          );
        },
      );
    });
  });
}
