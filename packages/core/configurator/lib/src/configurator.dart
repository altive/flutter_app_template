import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import 'config.dart';

/// A class that wraps Remote Config.
/// Its role is to "fetch the configured parameters from remote and provide
/// them".
///
/// Exposes [fetchAndActivate] and configuration methods for Remote Config.
class Configurator {
  /// If [rc] is null, a singleton instance of [FirebaseRemoteConfig] is used.
  Configurator({FirebaseRemoteConfig? rc})
    : _rc = rc ?? FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _rc;

  /// Fetch and activate parameters from remote.
  Future<bool> fetchAndActivate() async {
    return _rc.fetchAndActivate();
  }

  /// Activate parameters fetched from remote.
  Future<bool> activate() async {
    return _rc.activate();
  }

  /// Configure settings related to parameter fetching.
  Future<void> configure({
    required Duration fetchTimeout,
    required Duration minimumFetchInterval,
  }) async {
    await _rc.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: fetchTimeout,
        minimumFetchInterval: minimumFetchInterval,
      ),
    );
  }

  /// Set default values for when parameters cannot be fetched from remote.
  Future<void> setDefaults(Map<String, Object?> defaultParameters) async {
    for (final p in defaultParameters.values) {
      assert(p is String || p is int || p is double || p is bool);
    }
    await _rc.setDefaults(defaultParameters);
  }

  /// Provide a Stream of updated parameter information.
  ///
  /// NOTE: In the method form, each call inadvertently creates
  /// a different Stream, resulting in only the latest one being functional.
  /// To address this issue, we use a property form to ensure a unique and
  /// consistent Stream for each instance.
  @visibleForTesting
  late final Stream<RemoteConfigUpdate> onConfigUpdated = _rc.onConfigUpdated;

  /// Filter the Stream of updated parameter information by key.
  Stream<RemoteConfigUpdate> filteredOnConfigUpdated(String key) {
    return onConfigUpdated.where((config) => config.updatedKeys.contains(key));
  }

  /// Get the value of the parameter of type [String].
  @visibleForTesting
  String getString(String key) {
    final value = _rc.getString(key);
    return value;
  }

  /// Get the value of the parameter of type [int].
  @visibleForTesting
  int getInt(String key) {
    final value = _rc.getInt(key);
    return value;
  }

  /// Get the value of the parameter of type [double].
  @visibleForTesting
  double getDouble(String key) {
    final value = _rc.getDouble(key);
    return value;
  }

  /// Get the value of the parameter of type [bool].
  @visibleForTesting
  bool getBool(String key) {
    final value = _rc.getBool(key);
    return value;
  }

  /// Returns a JSON string converted to a [Map] type.
  @visibleForTesting
  Map<String, Object?> getJson(String key) {
    final value = _rc.getString(key);
    return json.decode(value) as Map<String, dynamic>;
  }

  /// Returns a List JSON string converted to a [List] type.
  @visibleForTesting
  List<Map<String, Object?>> getListJson(String key) {
    final value = _rc.getString(key);
    final list = json.decode(value) as List<dynamic>;
    return list.map((dynamic e) => e as Map<String, Object?>).toList();
  }

  /// Class Object from JSON.
  @visibleForTesting
  T getData<T extends Object>({
    required String key,
    required T Function(Map<String, Object?>) fromJson,
  }) {
    final json = getJson(key);
    return fromJson(json);
  }

  /// Returns a [Config] of type [String].
  Config<String> getStringConfig(
    String key, {
    ValueChanged<String>? onConfigUpdated,
  }) {
    return Config<String>(
      value: getString(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getString(key));
            }),
    );
  }

  /// Returns a [Config] of type [int].
  Config<int> getIntConfig(String key, {ValueChanged<int>? onConfigUpdated}) {
    return Config<int>(
      value: getInt(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getInt(key));
            }),
    );
  }

  /// Returns a [Config] of type [double].
  Config<double> getDoubleConfig(
    String key, {
    ValueChanged<double>? onConfigUpdated,
  }) {
    return Config<double>(
      value: getDouble(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getDouble(key));
            }),
    );
  }

  /// Returns a [Config] of type [bool].
  Config<bool> getBoolConfig(
    String key, {
    ValueChanged<bool>? onConfigUpdated,
  }) {
    return Config<bool>(
      value: getBool(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getBool(key));
            }),
    );
  }

  /// Returns a [Config] of type [Map].
  Config<Map<String, Object?>> getJsonConfig(
    String key, {
    ValueChanged<Map<String, Object?>>? onConfigUpdated,
  }) {
    return Config<Map<String, Object?>>(
      value: getJson(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getJson(key));
            }),
    );
  }

  /// Returns a [Config] of type [List] of [Map].
  Config<List<Map<String, Object?>>> getListJsonConfig(
    String key, {
    ValueChanged<List<Map<String, Object?>>>? onConfigUpdated,
  }) {
    return Config<List<Map<String, Object?>>>(
      value: getListJson(key),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getListJson(key));
            }),
    );
  }

  /// Returns a [Config] of type [T].
  Config<T> getDataConfig<T extends Object>(
    String key, {
    required T Function(Map<String, Object?>) fromJson,
    ValueChanged<T>? onConfigUpdated,
  }) {
    return Config<T>(
      value: getData<T>(key: key, fromJson: fromJson),
      subscription: kIsWeb || onConfigUpdated == null
          ? null
          : filteredOnConfigUpdated(key).listen((event) async {
              await activate();
              onConfigUpdated(getData(key: key, fromJson: fromJson));
            }),
    );
  }
}
