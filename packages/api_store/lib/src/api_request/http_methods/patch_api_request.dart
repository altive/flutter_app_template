import '../api_request.dart';

/// PATCHメソッドのAPIリクエスト
///
/// Request Body: あり
/// Response Body: あり
/// 冪等性：なし
/// https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/PATCH
abstract class PatchApiRequest<T> extends ApiRequest<T> with Body {
  const PatchApiRequest();
}
