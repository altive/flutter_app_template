import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../utils/utils.dart';
import 'recommend_stock_set_parameter.dart';
import 'required_version_parameter.dart';

class RemoteConfigService {
  const RemoteConfigService({FirebaseRemoteConfig? remoteConfig})
      : _remoteConfig = remoteConfig;

  final FirebaseRemoteConfig? _remoteConfig;

  static RemoteConfigService? _instance;

  /// 一意のインスタンスを使用する
  static Future<RemoteConfigService?> getInstance() async {
    if (_instance == null) {
      final remoteConfig = FirebaseRemoteConfig.instance;
      _instance = RemoteConfigService(remoteConfig: remoteConfig);
      // デフォルト値をセット
      await setupDefaults(remoteConfig);
      // リモートの値を取りに行く更新頻度
      // 本番環境ではデフォルトの12時間、その他開発環境では0に設定…したかった
      // final duration = flavor == Flavor.production
      //     ? const Duration(hours: 12)
      //     : Duration.zero;
      const interval = bool.fromEnvironment('dart.vm.product')
          ? Duration(hours: 12)
          : Duration.zero;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: interval,
        ),
      );
      // Fetch開始
      try {
        await remoteConfig.fetchAndActivate();
      } on Exception catch (e) {
        logger.warning(e);
      }
    }
    return _instance;
  }

  // Key文字列の定義
  static const recommendedAsinListForSearchEntranceKey =
      'recommended_asin_list_for_search_entrance';
  static const recommendStockSetListKey = 'recommend_stock_set_list';
  static const termsUrlKey = 'terms_url';
  static const privacyPoliciesUrlKey = 'privacy_policies_url';
  static const requiredAppVersionKey = 'required_app_version';

  /// 各デフォルト値を設定
  static Future<void> setupDefaults(FirebaseRemoteConfig remoteConfig) async {
    return remoteConfig.setDefaults(<String, dynamic>{
      recommendedAsinListForSearchEntranceKey: '["B01BEPNPF6"]',
      requiredAppVersionKey:
          '''{"isEnabled":false,"enabledAt":"2020-07-12T12:00+09:00","canCancel":true,"requiredBuildNumber":1}''',
      recommendStockSetListKey: '{}',
      termsUrlKey: 'https://nerco.jp/rolling-stock-terms/',
      privacyPoliciesUrlKey: 'https://nerco.jp/rolling-stock-privacy/',
    });
  }

  // String型
  // ---------------------------------------------------------------------------

  /// 利用規約のURL
  String get termsUrl => _remoteConfig!.getString(termsUrlKey);

  /// プライバシーポリシーのURL
  String get privacyPoliciesUrl =>
      _remoteConfig!.getString(privacyPoliciesUrlKey);

  // [String]型
  // ---------------------------------------------------------------------------

  /// 配列始まりのJSON文字列をデコードしてリスト型にして返す
  List<String> _jsonListFromString(String str) =>
      List<String>.from(json.decode(str) as List<dynamic>);

  /// 検索画面で表示するオススメ商品のASINリスト
  List<String> get recommendedAsinListForSearchEntrance {
    final jsonString =
        _remoteConfig!.getString(recommendedAsinListForSearchEntranceKey);
    return _jsonListFromString(jsonString);
  }

  // JSON型
  // ---------------------------------------------------------------------------

  /// 要求アプリバージョン
  RequiredVersion get requiredAppVersion {
    final jsonString = _remoteConfig!.getString(requiredAppVersionKey);
    final map = json.decode(jsonString) as Map<String, dynamic>;
    return RequiredVersion.fromJson(map);
  }

  // [JSON]型
  // ---------------------------------------------------------------------------

  /// チェッカーページで表示するお勧めストックセットリスト
  List<RecommendStockSet> get recommendStockSetList {
    // RemoteConfigからJSON文字列を取得
    final jsonString = _remoteConfig!.getString(recommendStockSetListKey);
    // 配列型なのでまずは `List<String>` に変換する
    final list = List<dynamic>.from(json.decode(jsonString) as List<dynamic>);
    logger.finer(list);
    // リストの個数分、 `RecommendStockSet` に変換して返す
    return list.map((dynamic jsonString) {
      logger.finer(jsonString as Map<String, dynamic>);
      // まずMap型に変換
      final map = jsonString;
      return RecommendStockSet.fromJson(map);
    }).toList();
  }
}
