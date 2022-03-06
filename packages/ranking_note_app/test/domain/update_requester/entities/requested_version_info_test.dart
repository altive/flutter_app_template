import 'package:flutter_test/flutter_test.dart';
import 'package:ranking_note_app/domain/update_requester/entities/requested_version_info.dart';

void main() {
  // 日本時間を想定した日時
  final date = DateTime(2018, 4, 4);
  // 日本時間標準時を考慮した時差
  const jstOffset = Duration(hours: 9);
  // JSTと実行環境によるTimeZoneを考慮し、UTCに変換
  final enabledAt = date.subtract(jstOffset).add(date.timeZoneOffset).toUtc();

  group('RequestedVersionInfo', () {
    group('fromJson', () {
      test('同じ値を引数に与えた時、コンストラクタで生成したオブジェクトとfromJsonで生成したオブジェクトが同一', () {
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
      });

      test('JSTでenabled_atを指定しても、コンストラクタで生成したオブジェクトとfromJsonで生成したオブジェクトが同一',
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
      });

      test('DateTimeに変換不可能な日付文字列の場合は例外が発生する', () {
        expect(
          () => RequestedVersionInfo.fromJson(<String, Object?>{
            'required_version': '1.0.0',
            'can_cancel': true,
            'enabled_at': '2018年4月4日',
          }),
          throwsFormatException,
        );
      });
    });
  });
}
