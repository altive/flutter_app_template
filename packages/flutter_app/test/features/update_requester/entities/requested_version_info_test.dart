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
          final target = RequestedVersionInfo.fromJson(const <String, Object?>{
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
            () => RequestedVersionInfo.fromJson(const <String, Object?>{
              'required_version': '1.0.0',
              'can_cancel': true,
              'enabled_at': '2018年4月4日',
            }),
            throwsA(isA<CheckedFromJsonException>()),
          );
        },
      );
    });

    group('toJson / copyWith', () {
      test('toJson outputs snake_case keys with ISO date string', () {
        final entity = RequestedVersionInfo(
          requiredVersion: '2.0.0',
          enabledAt: enabledAt,
        );

        expect(entity.toJson(), {
          'required_version': '2.0.0',
          'can_cancel': false,
          'enabled_at': enabledAt.toIso8601String(),
        });
      });

      test('copyWith updates only provided values', () {
        final entity = RequestedVersionInfo(
          requiredVersion: '1.0.0',
          enabledAt: enabledAt,
        );

        final copied = entity.copyWith(
          requiredVersion: '1.2.3',
          canCancel: true,
        );

        expect(copied.requiredVersion, '1.2.3');
        expect(copied.canCancel, isTrue);
        expect(copied.enabledAt, enabledAt);
      });
    });

    group('equatable', () {
      test('props determine equality and inequality', () {
        final base = RequestedVersionInfo(
          requiredVersion: '3.0.0',
          enabledAt: enabledAt,
        );

        final same = RequestedVersionInfo(
          requiredVersion: '3.0.0',
          enabledAt: enabledAt,
        );

        final different = RequestedVersionInfo(
          requiredVersion: '3.0.0',
          canCancel: true,
          enabledAt: enabledAt,
        );

        expect(base, equals(same));
        expect(base == different, isFalse);
      });
    });
  });
}
