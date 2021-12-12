import '../api_request.dart';

/// GETメソッドのAPIリクエスト
///
/// Request Body: なし
/// Response Body: あり
/// 冪等性：あり
/// https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/GET
abstract class GetApiRequest<T> extends ApiRequest<T> with QueryParameters {
  const GetApiRequest();
}
