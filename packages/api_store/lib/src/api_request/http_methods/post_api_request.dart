import '../api_request.dart';

/// POSTメソッドのAPIリクエスト
///
/// Request Body: あり
/// Response Body: あり
/// 冪等性：なし
/// https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/POST
abstract class PostApiRequest<T> extends ApiRequest<T> with Body {
  const PostApiRequest();
}
