import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

/// 認証情報
class AwsV4Auth {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  AwsV4Auth({
    required this.accessKey,
    required this.secretKey,
    required this.path,
    required this.region,
    required this.service,
    required this.httpMethodName,
    required this.headers,
    required this.payload,
  }) {
    // イニシャライズ時に現在時刻をセット
    _xAmzDate = _getNowUtcTimestamp;
    _currentDate = _getNowUtcDate;
  }

  // ----------------------------------------
  // Field
  // ----------------------------------------
  final String accessKey;
  final String secretKey;
  final String? path;
  final String region;
  final String service;
  final String httpMethodName;
  SplayTreeMap<String, String?> headers;
  final String payload;

  static const String _hmacAlgorithm = 'AWS4-HMAC-SHA256';
  static const String _aws4Request = 'aws4_request';

  String? _xAmzDate;
  late String _currentDate;

  String? _signedHeadersList;

  // ----------------------------------------
  // Getters
  // ----------------------------------------
  /// `yyyyMMdd'T'HHmmss'Z'` 表記のUTC時間
  String get _getNowUtcTimestamp {
    final timestamp =
        DateFormat("yyyyMMdd'T'HHmmss'Z'").format(DateTime.now().toUtc());
    return timestamp;
  }

  /// `yyyyMMdd` 表記のUTC時間
  String get _getNowUtcDate {
    final date = DateFormat('yyyyMMdd').format(DateTime.now().toUtc());
    return date;
  }

  /// ヘッダーを返却
  SplayTreeMap<String, String?> get getHeaders {
    // 現在日付
    headers['x-amz-date'] = _xAmzDate;
    // Step 1: CREATE A CANONICAL REQUEST
    final canonicalUrl = _prepareCanonicalRequest();
    // Step 2: CREATE THE STRING TO SIGN
    final stringToSign = _prepareStringToSign(canonicalUrl);
    // Step 3: CALCULATE THE SIGNATURE
    final signature = _calculateSignature(stringToSign);
    // Step 4: CALCULATE AUTHORIZATION HEADER
    headers['Authorization'] = _buildAuthorizationString(signature);
    return headers;
  }

  // ----------------------------------------
  // Methods
  // ----------------------------------------
  /// カノニカルURLの作成
  String _prepareCanonicalRequest() {
    final canonicalUrlBuf = StringBuffer()
      ..writeln(httpMethodName)
      ..writeln('$path')
      ..writeln(); // 最後は改行2つ必要なため

    final signedHeaderBuffer = StringBuffer();

    for (final entrySet in headers.entries) {
      final key = entrySet.key;
      final value = entrySet.value;
      signedHeaderBuffer.write('$key;');
      canonicalUrlBuf.writeln('$key:$value');
    }
    canonicalUrlBuf.writeln();

    _signedHeadersList = signedHeaderBuffer.toString();
    _signedHeadersList =
        _signedHeadersList!.substring(0, _signedHeadersList!.length - 1);

    canonicalUrlBuf
      ..writeln(_signedHeadersList)
      ..write(_generateSha256Hex(payload));

    final canonicalUrl = canonicalUrlBuf.toString();
    return canonicalUrl;
  }

  /// 符号付き文字列の作成
  String _prepareStringToSign(String canonicalUrl) {
    final stringToSign = StringBuffer()
      ..writeln(_hmacAlgorithm)
      ..writeln(_xAmzDate)
      ..writeln('$_currentDate/$region/$service/$_aws4Request')
      ..write(_generateSha256Hex(canonicalUrl));
    return stringToSign.toString();
  }

  /// 署名を計算する
  String _calculateSignature(String stringToSign) {
    final signatureKey = _getSignatureKey(
      secretKey: secretKey,
      date: _currentDate,
      region: region,
      service: service,
    );
    final signature =
        _hmacSha256ToDigest(key: signatureKey, data: stringToSign);
    return signature.toString();
  }

  /// HeaderのAuthorizationで使用する認証文字列を作成
  String _buildAuthorizationString(String signature) {
    final buf = StringBuffer()
      ..write(_hmacAlgorithm)
      ..write(' Credential=')
      ..write('$accessKey/$_getNowUtcDate/$region/$service/$_aws4Request,')
      ..write('SignedHeaders=$_signedHeadersList,')
      ..write('Signature=$signature');
    final authString = buf.toString();
    return authString;
  }

  /// データ文字列を256ビット長にハッシュ化
  String _generateSha256Hex(String data) {
    final bytes = utf8.encode(data);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  ///
  List<int> _getSignatureKey({
    required String secretKey,
    required String date,
    required String region,
    required String service,
  }) {
    final secretKeyBytes = utf8.encode('AWS4$secretKey');
    final dateBytes = _hmacSha256ToBytes(key: secretKeyBytes, data: date);
    final regionBytes = _hmacSha256ToBytes(key: dateBytes, data: region);
    final serviceBytes = _hmacSha256ToBytes(key: regionBytes, data: service);
    final signingBytes =
        _hmacSha256ToBytes(key: serviceBytes, data: _aws4Request);
    return signingBytes;
  }

  /// HMAC-SHA-256
  List<int> _hmacSha256ToBytes({
    required List<int> key,
    required String data,
  }) {
    final digest = _hmacSha256ToDigest(key: key, data: data);
    return digest.bytes;
  }

  Digest _hmacSha256ToDigest({required List<int> key, required String data}) {
    final hmac = Hmac(sha256, key);
    final dataBytes = utf8.encode(data);
    final dataDigest = hmac.convert(dataBytes);
    return dataDigest;
  }
}
