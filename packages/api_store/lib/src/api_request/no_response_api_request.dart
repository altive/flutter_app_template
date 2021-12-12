import 'api_request.dart';

/// レスポンスが無いことを示すクラス
class NoResponse {
  const NoResponse();
}

/// レスポンスが無いAPIリクエスト
abstract class NoResponseApiRequest extends ApiRequest<NoResponse> {
  const NoResponseApiRequest();

  @override
  NoResponse parse(Object data) {
    return const NoResponse();
  }
}
