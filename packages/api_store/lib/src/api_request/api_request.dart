import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;

export 'http_methods/http_methods.dart';
export 'no_response_api_request.dart';

/// APIリクエストの基底クラス
abstract class ApiRequest<T> {
  const ApiRequest();

  /// APIエンドポイントのパス部分（パスパラメータを含む）
  String get path;

  /// リクエストで取得したJSONをデータクラスに変換して返す
  T parse(Object data);

  @override
  String toString() => '$runtimeType: $path';
}

/// APIリクエストで クエリパラメータ を提供できる
mixin QueryParameters {
  Map<String, Object?> get queryParameters;
}

/// APIリクエストで Body (Data) を提供できる
mixin Body {
  Map<String, Object?> get body;
}

/// Form-Data形式の Body (Data) を提供できる
mixin FormDataBody on Body {
  @override
  Map<String, Object?> get body => throw AssertionError();

  Map<String, Object?> get formDataMap;

  FormData get formData => FormData.fromMap(formDataMap);

  /// ファイルパスからMultipartFileを作成する非同期処理
  Future<MultipartFile> multipartFileFromFilePath(String filePath) async {
    final filename = path.basename(filePath);
    return MultipartFile.fromFile(
      filePath,
      filename: filename,
      contentType: _detectMediaType(filename),
    );
  }

  /// ファイル名からMediaTypeを判断して返す
  MediaType _detectMediaType(String filename) {
    switch (path.extension(filename)) {
      case '.jpg':
      case '.jpeg':
        return MediaType.parse('image/jpeg');
      case '.gif':
        return MediaType.parse('image/gif');
      case '.png':
        return MediaType.parse('image/png');
      case '.heic':
        return MediaType.parse('image/heic');
      case '.heif':
        return MediaType.parse('image/heic');
      case '.pdf':
        return MediaType.parse('application/pdf');
    }
    throw ArgumentError.value(filename);
  }
}
