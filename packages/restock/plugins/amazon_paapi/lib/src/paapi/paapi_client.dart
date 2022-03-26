import 'dart:collection';

import 'package:http/http.dart' as http;

import '../utils/utils.dart';
import 'aws_v4_auth.dart';
import 'get_items/paapi_get_items_parameters.dart';
import 'search_items/paapi_search_items_parameters.dart';

enum PaapiOperation {
  /// 商品検索
  searchItems,

  /// 商品取得
  getItems,
}

extension Ex on PaapiOperation {
  String get path {
    switch (this) {
      case PaapiOperation.getItems:
        return '/paapi5/getitems';
      case PaapiOperation.searchItems:
        return '/paapi5/searchitems';
    }
  }

  String get target {
    switch (this) {
      case PaapiOperation.getItems:
        return 'com.amazon.paapi5.v1.ProductAdvertisingAPIv1.GetItems';
      case PaapiOperation.searchItems:
        return 'com.amazon.paapi5.v1.ProductAdvertisingAPIv1.SearchItems';
    }
  }
}

/// Product Advertising API 5.x
class PaapiClient {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  PaapiClient({
    required String accessKey,
    required String secretKey,
    required String partnerTag,
  })  : _accessKey = accessKey,
        _secretKey = secretKey,
        _partnerTag = partnerTag {
    _instance = this;
  }

  /// Singleton instance.
  /// Must initialize.
  factory PaapiClient.instance() {
    if (_instance == null) {
      throw AssertionError('initialize has not been called yet.');
    }
    return _instance!;
  }

  /// Instance cache.
  static PaapiClient? _instance;

  // ----------------------------------
  // Field
  // ----------------------------------

  final String _accessKey;
  final String _secretKey;
  final String _partnerTag;

  static const String host = 'webservices.amazon.co.jp';
  static const String region = 'us-west-2';
  static const String serviceName = 'ProductAdvertisingAPI';
  static const String partnerType = 'Associates';
  static const String marketplace = 'www.amazon.co.jp';
  static const String contentType = 'application/json; charset=utf-8';
  static const String contentEncoding = 'amz-1.0';
  static const String methodName = 'POST';

  // ----------------------------------
  // Public Methods
  // ----------------------------------

  /// 商品取得API
  Future<http.Response?> getItems({
    required PaapiGetItemsParameters parameters,
  }) async {
    const operation = PaapiOperation.getItems;
    // ペイロードを作成
    final payload = _createPayloadForGetItems(parameters: parameters);
    // ベースとなるヘッダーを作成
    final baseHeaders = _generateBaseHeaders(
      operation: operation,
    );
    // 認証し、認証済みのヘッダーを取得
    final authorizedHeaders = _authorizeAndGetHeaders(
      baseHeaders: baseHeaders,
      payload: payload,
      operation: operation,
    );
    try {
      // POSTでリクエストを送信
      return http.post(
        Uri.https(host, operation.path),
        headers: Map.from(authorizedHeaders),
        body: payload,
      );
    } on http.ClientException catch (exception) {
      logger.warning(exception);
      return null;
    } on Exception catch (exception) {
      logger.warning(exception);
      return null;
    }
  }

  /// 商品検索API
  Future<http.Response> searchItems({
    required PaapiSearchItemsParameters parameters,
  }) async {
    const operation = PaapiOperation.searchItems;
    // ペイロードを作成
    final payload = _createPayloadForSearchItems(parameters: parameters);
    // ベースとなるヘッダーを作成
    final baseHeaders = _generateBaseHeaders(
      operation: operation,
    );
    // 認証し、認証済みのヘッダーを取得
    final authorizedHeaders = _authorizeAndGetHeaders(
      baseHeaders: baseHeaders,
      payload: payload,
      operation: operation,
    );
    // POSTでリクエストを送信
    final response = await http.post(
      Uri.https(host, operation.path),
      headers: Map.from(authorizedHeaders),
      body: payload,
    );
    logger.fine(
      '''
Response: ${response.request}
Status Code: ${response.statusCode}
Body: ${response.body}
    ''',
    );
    return response;
  }

// ----------------------------------
  // Private Methods
  // ----------------------------------
  /// 商品取得API用のPayloadを作成
  String _createPayloadForGetItems({
    required PaapiGetItemsParameters parameters,
  }) {
    final payloadBuffer = StringBuffer('{');
    // ASINリストを展開
    final asinList = _unfoldListParameter(parameters.asin);
    // レスポンス要素指定リストを展開
    final resources = _unfoldListParameter(parameters.resources);
    payloadBuffer
      ..write('"Resources":[$resources],')
      ..write('"ItemIds":[$asinList],')
      ..write('"PartnerTag":"$_partnerTag",')
      ..write('"PartnerType":"$partnerType",')
      ..write('"Marketplace":"$marketplace"')
      ..write('}');
    // ペイロード文字列を作成完了
    final payload = payloadBuffer.toString();
    logger.fine('Payload: $payload');
    return payload;
  }

  /// 商品検索API用のPayloadを作成
  String _createPayloadForSearchItems({
    required PaapiSearchItemsParameters parameters,
  }) {
    final payloadBuffer = StringBuffer('{');
    // 任意パラメータをセット
    if (parameters.searchIndex != null) {
      payloadBuffer.write('"SearchIndex":"${parameters.searchIndex}",');
    }
    if (parameters.itemCount != null) {
      payloadBuffer.write('"ItemCount":${parameters.itemCount},');
    }
    if (parameters.resources.isNotEmpty) {
      final resources = _unfoldListParameter(parameters.resources);
      payloadBuffer.write('"Resources":[$resources],');
    }
    // 必須パラメータをセット
    payloadBuffer
      // MEMO: "Keywords"にするとより広く検索できる
      ..write('"Keywords":"${parameters.keyword}",')
      ..write('"PartnerTag":"$_partnerTag",')
      ..write('"PartnerType":"$partnerType",')
      ..write('"Marketplace":"$marketplace"')
      ..write('}');
    // ペイロード文字列を作成完了
    final payload = payloadBuffer.toString();
    logger.fine('Payload: $payload');
    return payload;
  }

  // List<String> '["Xxx", "Yyy", "Zzz"]' の形式にする
  String _unfoldListParameter(List<String> list) {
    final resourcesBuf = StringBuffer();
    for (final item in list) {
      resourcesBuf.write('"$item",');
    }
    final unfolded = resourcesBuf.toString();
    // 最後の不要なカンマを取り除く
    return unfolded.substring(0, unfolded.length - 1);
  }

  /// 基底Headerを作成
  SplayTreeMap<String, String?> _generateBaseHeaders({
    required PaapiOperation operation,
  }) {
    final baseHeaders = SplayTreeMap<String, String?>();
    baseHeaders['content-encoding'] = contentEncoding;
    baseHeaders['content-type'] = contentType;
    baseHeaders['host'] = host;
    baseHeaders['x-amz-target'] = operation.target;
    return baseHeaders;
  }

  /// 基底HeaderとPayloadを使用して認証済みのHeaderを返す
  SplayTreeMap<String, String?> _authorizeAndGetHeaders({
    required SplayTreeMap<String, String?> baseHeaders,
    required String payload,
    required PaapiOperation operation,
  }) {
    // 認証情報を作成
    final awsV4Auth = AwsV4Auth(
      accessKey: _accessKey,
      secretKey: _secretKey,
      path: operation.path,
      region: region,
      service: serviceName,
      httpMethodName: methodName,
      headers: baseHeaders,
      payload: payload,
    );
    // 認証情報を含んだヘッダー
    final authHeader = awsV4Auth.getHeaders;
    return authHeader;
  }
}
