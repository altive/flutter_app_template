import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/utils.dart';

/// 対象のURLをWebViewで開きPushする。セカンドURLも設定できる
Future<bool> launchWeb(String? url, {String? secondUrl}) async {
  if (url == null) {
    logger.finer('URLがnullです');
    return false;
  }
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    return launchUrl(uri);
  } else if (secondUrl != null && await canLaunchUrlString(secondUrl)) {
    final secondUri = Uri.parse(secondUrl);
    return launchUrl(secondUri);
  } else {
    logger.warning('開けないURLです: $url, $secondUrl');
    return false;
  }
}
