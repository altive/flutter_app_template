// import 'package:collection/collection.dart' show IterableExtension;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferencesをラップしたクラス。
/// `SharedPreferences.getInstance()`が非同期関数のため、`initialize` が必要
/// Available types: bool, double, int, String, List<String>
class LocalPreferences {
  LocalPreferences();

  late final SharedPreferences _prefs;

  final Map<String, StreamController<Object>> _controllers = {};

  /// must call.
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    final keys = _prefs.getKeys();
    for (final key in keys) {
      final value = _prefs.get(key);
      _controllers[key] = StreamController<String>();
      _controllers[key]!.sink.add(value!);
    }
  }

  Future<bool> clear() async {
    for (final controller in _controllers.values) {
      await controller.close();
    }
    _controllers.clear();
    return _prefs.clear();
  }

  Future<void> setString(String key, String value) async {
    if (_prefs.containsKey(key)) {
      final succeeded = await _prefs.setString(key, value);
      if (!succeeded) {
        return;
      }
      _controllers[key] = StreamController<String>();
      _controllers[key]!.sink.add(value);
    }
  }

  Stream<String> streamString(String key) {
    if (!_controllers.containsKey(key)) {
      throw ArgumentError.value(key, key, 'key not found.');
    }
    if (_controllers[key]! is! StreamController<String>) {
      throw ArgumentError.value(key, key, 'key is not String.');
    }

    return _controllers[key]!.stream as Stream<String>;
  }
}
