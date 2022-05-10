import 'package:url_launcher/url_launcher_string.dart';

import '../utils/utils.dart';

/// 対象のURLをWebViewで開きPushする。セカンドURLも設定できる
Future<bool> launchUrl(String? url, {String? secondUrl}) async {
  if (url == null && secondUrl == null) {
    logger.finer('URLがnullです');
    return false;
  }
  if (await canLaunchUrlString(url!)) {
    return launchUrlString(url);
  } else if (secondUrl != null && await canLaunchUrlString(secondUrl)) {
    return launchUrlString(secondUrl);
  } else {
    logger.warning('開けないURLです：$url, $secondUrl');
    return false;
  }
}
