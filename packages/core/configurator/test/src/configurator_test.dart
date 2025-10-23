import 'dart:async';

import 'package:configurator/configurator.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../data_class.dart';

class _MockRemoteConfig extends Mock implements FirebaseRemoteConfig {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
  });
  group('fetchAndActivate', () {
    test('Remote ConfigのfetchAndActivateが実行されること', () async {
      final mockRC = _MockRemoteConfig();
      when(mockRC.fetchAndActivate).thenAnswer((_) async => true);
      await Configurator(rc: mockRC).fetchAndActivate();

      verify(mockRC.fetchAndActivate).called(1);
    });
  });

  group('configure', () {
    test('Remote ConfigのsetConfigSettingsが実行されること', () async {
      final mockRC = _MockRemoteConfig();
      when(
        () => mockRC.setConfigSettings(any()),
      ).thenAnswer((_) => Future<void>.value());

      await Configurator(rc: mockRC).configure(
        fetchTimeout: const Duration(seconds: 1),
        minimumFetchInterval: const Duration(hours: 1),
      );

      verify(
        () => mockRC.setConfigSettings(any()),
      ).called(1);
    });
  });

  group('setDefaults', () {
    test('Error occurs when setting a Class instance as a value', () async {
      final mockRC = _MockRemoteConfig();
      when(
        () => mockRC.setDefaults({'key': 'value'}),
      ).thenAnswer((_) async => {});

      await Configurator(rc: mockRC).setDefaults({'key': 'value'});

      verify(
        () => mockRC.setDefaults({'key': 'value'}),
      );
    });

    test('Error occurs when setting a List type as a value', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      expect(
        () async => target.setDefaults({
          'key': ['ABC', 'DEF'],
        }),
        throwsAssertionError,
      );
    });

    test('Error occurs when setting a Map type as a value', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      expect(
        () async => target.setDefaults({
          'key': {'key': 'value'},
        }),
        throwsAssertionError,
      );
    });
  });

  group('onConfigUpdated', () {
    test('Can retrieve the Stream of RemoteConfigUpdate', () async {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      final stream = target.onConfigUpdated;
      expect(stream, isA<Stream<RemoteConfigUpdate>>());
    });
  });

  group('filteredOnConfigUpdated', () {
    test(
      'Can retrieve the Stream of RemoteConfigUpdate filtered by key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'string_001';

        final stream = target.filteredOnConfigUpdated(key);
        expect(stream, isA<Stream<RemoteConfigUpdate>>());
      },
    );
  });

  group('getString', () {
    test('Can retrieve the Remote string corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'string_001';

      final value = target.getString(key);
      expect(value, equals('string_value'));
    });
  });

  group('getInt', () {
    test('Can retrieve the Remote integer corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'int_001';

      final value = target.getInt(key);
      expect(value, equals(1));
    });
  });

  group('getDouble', () {
    test(
      'Can retrieve the Remote floating-point number corresponding to the key',
      () {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'double_001';

        final value = target.getDouble(key);
        expect(value, equals(0.1));
      },
    );
  });

  group('getBool', () {
    test('Can retrieve the boolean value corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'bool_001';

      final value = target.getBool(key);
      expect(value, isTrue);
    });
  });

  group('getJson', () {
    test('Can retrieve the JSON (Map) corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'json_001';

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
    test('Can retrieve the list of JSON (Map) corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'list_json_001';

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
          },
        ],
      );
    });
  });

  group('getData', () {
    test('Can retrieve the class object corresponding to the key', () {
      final mockRC = _FakeRemoteConfig();
      final target = Configurator(rc: mockRC);

      const key = 'data_001';

      final value = target.getData(key: key, fromJson: DataClass.fromJson);

      expect(value, const DataClass(value: 'tokyo'));
    });
  });

  group('getStringConfig', () {
    test(
      'Can retrieve the Config<String> corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'string_001';
        var updatedValue = '';

        final config = target.getStringConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<String>>());
        expect(config.value, equals('string_value'));

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, equals('string_value'));
      },
    );
  });

  group('getIntConfig', () {
    test(
      'Can retrieve the Config<int> corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'int_001';
        var updatedValue = 0;

        final config = target.getIntConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<int>>());
        expect(config.value, equals(1));

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, equals(1));
      },
    );
  });

  group('getDoubleConfig', () {
    test(
      'Can retrieve the Config<double> corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'double_001';
        var updatedValue = 0.0;

        final config = target.getDoubleConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<double>>());
        expect(config.value, equals(0.1));

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, equals(0.1));
      },
    );
  });

  group('getBoolConfig', () {
    test(
      'Can retrieve the Config<bool> corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'bool_001';
        var updatedValue = false;

        final config = target.getBoolConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<bool>>());
        expect(config.value, isTrue);

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, isTrue);
      },
    );
  });

  group('getJsonConfig', () {
    test(
      'Can retrieve the Config<Map<String, Object?>> '
      'corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'json_001';
        var updatedValue = <String, Object?>{};

        final config = target.getJsonConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<Map<String, Object?>>>());
        expect(config.value, <String, Object?>{
          'value_1': '01',
          'value_2': 2,
          'value_3': 3.0,
          'value_4': true,
        });

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, <String, Object?>{
          'value_1': '01',
          'value_2': 2,
          'value_3': 3.0,
          'value_4': true,
        });
      },
    );
  });

  group('getListJsonConfig', () {
    test(
      'Can retrieve the Config<List<Map<String, Object?>>> '
      'corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'list_json_001';
        var updatedValue = <Map<String, Object?>>[];

        final config = target.getListJsonConfig(
          key,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<List<Map<String, Object?>>>>());
        expect(
          config.value,
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
            },
          ],
        );

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(
          updatedValue,
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
            },
          ],
        );
      },
    );
  });

  group('getDataConfig', () {
    test(
      'Can retrieve the Config<Object> corresponding to the key',
      () async {
        final mockRC = _FakeRemoteConfig();
        final target = Configurator(rc: mockRC);

        const key = 'data_001';
        var updatedValue = const DataClass(value: '');

        final config = target.getDataConfig(
          key,
          fromJson: DataClass.fromJson,
          onConfigUpdated: (value) {
            updatedValue = value;
          },
        );
        addTearDown(config.dispose);

        expect(config, isA<Config<DataClass>>());
        expect(config.value, const DataClass(value: 'tokyo'));

        mockRC.configUpdatesController.add(
          RemoteConfigUpdate(<String>{key}),
        );

        await pumpEventQueue();

        expect(updatedValue, const DataClass(value: 'tokyo'));
      },
    );
  });
}

class _FakeRemoteConfig extends Fake implements FirebaseRemoteConfig {
  final configUpdatesController = StreamController<RemoteConfigUpdate>();

  @override
  Stream<RemoteConfigUpdate> get onConfigUpdated =>
      configUpdatesController.stream;

  @override
  String getString(String key) {
    switch (key) {
      case 'string_001':
        return 'string_value';

      case 'json_001':
        return '''
      {
        "value_1": "01",
        "value_2": 2,
        "value_3": 3.0,
        "value_4": true
      }
      ''';

      case 'list_json_001':
        return '''
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
      ''';

      case 'data_001':
        return '''
      {
        "value": "tokyo"
      }
      ''';
    }
    throw UnimplementedError();
  }

  @override
  int getInt(String key) {
    return 1;
  }

  @override
  double getDouble(String key) {
    return 0.1;
  }

  @override
  bool getBool(String key) {
    return true;
  }

  @override
  Future<bool> activate() async {
    return true;
  }

  void dispose() {
    unawaited(configUpdatesController.close());
  }
}
