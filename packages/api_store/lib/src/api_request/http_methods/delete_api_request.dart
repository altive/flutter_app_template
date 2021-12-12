import '../api_request.dart';

/// DELETEメソッドのAPIリクエスト
///
/// Request Body: 可
/// Response Body: 可
/// 冪等性：あり
/// https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/DELETE
abstract class DeleteApiRequest<T> extends NoResponseApiRequest
    with QueryParameters {
  const DeleteApiRequest();
}
