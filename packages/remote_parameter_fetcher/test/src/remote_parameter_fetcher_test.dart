import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:remote_parameter_fetcher/src/remote_parameter_fetcher.dart';
import 'package:test/test.dart';

import '../data_class.dart';
import 'remote_parameter_fetcher_test.mocks.dart';

@GenerateMocks([FirebaseRemoteConfig])
void main() {
  final mockRC = MockFirebaseRemoteConfig();

  group('getString', () {
    test('keyに対応した、Remoteの文字列が取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_string_0001';
      when(mockRC.getString(key)).thenReturn('string_value');

      final value = target.getString(key);
      expect(value, equals('string_value'));
    });
  });

  group('getInt', () {
    test('keyに対応した、Remoteの整数が取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_int_0001';
      when(mockRC.getInt(key)).thenReturn(1);

      final value = target.getInt(key);
      expect(value, equals(1));
    });
  });

  group('getDouble', () {
    test('keyに対応した、Remoteの浮動小数が取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_double_0001';
      when(mockRC.getDouble(key)).thenReturn(0.1);

      final value = target.getDouble(key);
      expect(value, equals(0.1));
    });
  });

  group('getBool', () {
    test('keyに対応した、真偽値が取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_bool_0001';
      when(mockRC.getBool(key)).thenReturn(true);

      final value = target.getBool(key);
      expect(value, isTrue);
    });
  });

  group('getJson', () {
    test('keyに対応した、JSON(Map)が取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_json_0001';
      when(mockRC.getString(key)).thenReturn(
        '''
      {
        "value_1": "01",
        "value_2": 2,
        "value_3": 3.0,
        "value_4": true
      }
      ''',
      );

      final value = target.getJson(key);
      expect(value, <String, Object?>{
        'value_1': '01',
        'value_2': 2,
        'value_3': 3.0,
        'value_4': true,
      });
    });
  });

  group('getListJson', () {
    test('keyに対応した、JSON(Map)のListが取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_list_json_0001';
      when(mockRC.getString(key)).thenReturn(
        '''
      [
        {
          "value_1a": "01a",
          "value_2a": 2,
          "value_3a": 3.0,
          "value_4a": true
        },
        {
          "value_1b": "01b",
          "value_2b": 20,
          "value_3b": 3.5,
          "value_4b": false
        }
      ]
      ''',
      );

      final value = target.getListJson(key);
      expect(
        value,
        [
          {
            'value_1a': '01a',
            'value_2a': 2,
            'value_3a': 3.0,
            'value_4a': true,
          },
          {
            'value_1b': '01b',
            'value_2b': 20,
            'value_3b': 3.5,
            'value_4b': false,
          }
        ],
      );
    });
  });

  group('getObjectFromJson', () {
    test('keyに対応した、クラスオブジェクトが取得できること', () {
      final target = RemoteParameterFetcher(rc: mockRC);

      const key = 'key_data_0001';

      when(mockRC.getString(key)).thenReturn(
        '''
        {
          "value": "tokyo"
        }
        ''',
      );

      final value = target.getObjectFromJson(DataClass.fromJson, key: key);

      expect(value, const DataClass(value: 'tokyo'));
    });
  });
}
