import '../api_request.dart';

/// PUTメソッドのAPIリクエスト
///
/// Request Body: あり
/// Response Body: なし
/// 冪等性：あり
/// https://developer.mozilla.org/ja/docs/Web/HTTP/Methods/PUT
abstract class PutApiRequest extends NoResponseApiRequest with Body {
  const PutApiRequest();
}
