import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/navigator.dart';
import '../../utils/utils.dart';

final dynamicLinksControllerProvider = Provider<DynamicLinksController>((ref) {
  return DynamicLinksController(ref.read);
});

class DynamicLinksController {
  // ----- Constructor ----- //
  DynamicLinksController(this._read);

  final Reader _read;

  final FirebaseDynamicLinks _dynamicLinks = FirebaseDynamicLinks.instance;

  /// Dynamic Linksの初期化
  Future<void> navigateDynamicLinksIfNeeded() async {
    // 1. アプリを起動させたダイナミックリンクを取得する
    /// DynamicLinks経由の起動じゃなかった場合は`null`が返ってくる
    final linkData = await FirebaseDynamicLinks.instance.getInitialLink();

    // 2. 取り出したリンクを扱う
    await _handleDeepLink(data: linkData);

    // 3. Dynamic Linksを使用してバックグラウンドからアプリを開いた場合のリスナー
    _dynamicLinks.onLink.listen(
      (linkData) async {
        logger.fine(linkData);
        // 取り出したリンクを扱う
        await _handleDeepLink(data: linkData);
      },
      onError: (Object exception) async {
        logger.warning('onLink error: $exception');
      },
    );
  }

  /// Dynamic Linkに設定したディープリンクをハンドリングする
  Future<void> _handleDeepLink({required PendingDynamicLinkData? data}) async {
    final deepLink = data?.link;
    if (deepLink != null) {
      logger.fine(deepLink);
      // URLパスを判定
      if (deepLink.pathSegments.contains('element')) {
        // パラメータからASINを取り出す
        final asin = deepLink.queryParameters['page'];
        if (asin != null) {
          // 画面へ遷移する
          await _read(navigatorKeyProvider)
              .currentState!
              .pushNamed(deepLink.path);
        }
      }
    }
  }

  /* 未使用

  /// アプリでリンクを発行する
  Future<Uri> createDynamicLink({bool needShort}) async {
    final parameters = DynamicLinkParameters(
      // URL
      uriPrefix: 'https://restock.page.link',
      // Webから開いた場合
      link: Uri.parse('uri'),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
      navigationInfoParameters: NavigationInfoParameters(
        forcedRedirectEnabled: true,
      ),
      // Androidで開いた時にPlay Storeを開くための設定
      androidParameters: AndroidParameters(
        packageName: 'jp.altive.restock',
      ),
      // iOSで開いた時にApp Storeを開くための設定
      iosParameters: IosParameters(
        bundleId: 'jp.altive.restock',
        appStoreId: 'aaa',
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: 'null',
        medium: 'null',
        source: 'null',
      ),
      itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
        providerToken: '',
        campaignToken: '',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: '',
        description: '',
      ),
    );

    Uri url;
    if (needShort) {
      final shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }
    return url;
  }
  
  */
}
