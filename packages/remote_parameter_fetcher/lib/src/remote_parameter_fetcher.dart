import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:meta/meta.dart';

/// Remote Configをラップしたクラス。
/// 役割は、「設定されたパラメータを取得し、アプリの要求する型で提供する」こと。
///
/// Remote Configに対する [fetchAndActivate] や、設定メソッドを公開。
/// [getString] 等のパラメータ取得メソッドは[internal]にしており、パッケージ内でのみ使用可能。
class RemoteParameterFetcher {
  RemoteParameterFetcher({
    FirebaseRemoteConfig? rc,
  }) : _rc = rc ?? FirebaseRemoteConfig.instance;

  final FirebaseRemoteConfig _rc;

  /// リモートからパラメータを取得して有効化する。
  Future<bool> fetchAndActivate() async {
    return _rc.fetchAndActivate();
  }

  /// パラメータの取得に関する設定を行う。
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

  /// リモートからパラメータを取得できない場合のデフォルト値を設定する。
  Future<void> setDefaults(Map<String, Object?> defaultParameters) async {
    await _rc.setDefaults(defaultParameters);
  }

  @internal
  String getString(String key) {
    final value = _rc.getString(key);
    return value;
  }

  @internal
  int getInt(String key) {
    final value = _rc.getInt(key);
    return value;
  }

  @internal
  double getDouble(String key) {
    final value = _rc.getDouble(key);
    return value;
  }

  @internal
  bool getBool(String key) {
    final value = _rc.getBool(key);
    return value;
  }

  /// Returns a JSON string converted to a [Map] type.
  @internal
  Map<String, Object?> getJson(String key) {
    final value = _rc.getString(key);
    return json.decode(value) as Map<String, dynamic>;
  }

  /// Returns a List JSON string converted to a [List] type.
  @internal
  List<Map<String, Object?>> getListJson(String key) {
    final value = _rc.getString(key);
    final list = json.decode(value) as List<dynamic>;
    return list.map((dynamic e) => e as Map<String, Object?>).toList();
  }

  /// Class Object from JSON.
  @internal
  T getObjectFromJson<T extends Object>(
    T Function(Map<String, Object?>) fromJson, {
    required String key,
  }) {
    final json = getJson(key);
    return fromJson(json);
  }
}
