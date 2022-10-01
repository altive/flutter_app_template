import 'dart:core';
import 'dart:io';

import 'package:analysis_logger/analysis_logger.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../environment.dart';
import '../../models/authenticator/auth_controller.dart';
import '../../utils/utils.dart';
import 'revenue_error_handler.dart';
import 'revenue_state.dart';

final revenueControllerProvider =
    StateNotifierProvider<RevenueController, RevenueState>((ref) {
  final user = ref.watch(authControllerProvider);
  // AppUserIDを更新する
  if (user != null) {
    // user == null の時に実行すると `Purchases.configure` の前に実行してしまうことがあるため
    // userのnull判定が必要
    Purchases.logIn(user.uid);
  }
  return RevenueController(ref);
});

/// アプリ内課金を制御する
class RevenueController extends StateNotifier<RevenueState> {
  // ----- Constructor ----- //
  RevenueController(
    this._ref,
  ) : super(const RevenueState()) {
    initialSetup();
  }

  final Ref _ref;

  AnalysisLogger get _logger => _ref.read(analysisLoggerProvider);

  /// 提供情報
  late Offerings _offerings;

  // 初期化処理
  Future<void> initialSetup() async {
    // 環境ごとに違う API Key
    final environment = _ref.read(environmentProvider);
    final String apiKey;
    if (Platform.isAndroid) {
      apiKey = environment.revenuecatPublicApiAndroidKey;
    } else if (Platform.isIOS) {
      apiKey = environment.revenuecatPublicApiIosKey;
    } else {
      throw Exception('未対応のプラットフォームです');
    }
    // APIキーを使用してセットアップ
    final configuration = PurchasesConfiguration(
      // RevenueCat - Configuration - API Keys - Public SDK Key's Key
      apiKey,
    );
    await Purchases.configure(configuration);
    // デバッグログを有効化（開発環境のみ）
    const isDebug = !bool.fromEnvironment('dart.vm.product');
    await Purchases.setDebugLogsEnabled(isDebug);
    // リスナー登録
    Purchases.addCustomerInfoUpdateListener(_updatePurchaserState);

    // iOSでアプリ再起動時にリスナー判定してくれなかった。手動で呼び出す必要ある
    final customerInfo = await Purchases.getCustomerInfo();
    _updatePurchaserState(customerInfo);
  }

  /// [customerInfo]の情報をもとに状態 [state] を更新する
  void _updatePurchaserState(CustomerInfo customerInfo) {
    final isSubscriber = _shouldSubscriber(customerInfo);
    if (mounted) {
      state = state.copyWith(
        // サブスクリプション契約判定
        isSubscriber: isSubscriber,
        // 情報更新日時
        updatedDateString: customerInfo.requestDate,
        // 有効期限
        latestExpirationDateString: customerInfo.latestExpirationDate,
      );
      logger.info('update purchaseState: $state');
    }
  }

  /// 現在利用可能な月間アプリ内課金プロダクトを取得
  Future<StoreProduct?> getMonthlyProduct() async {
    return _getProduct(packageType: PackageType.monthly);
  }

  /// 現在利用可能な年間アプリ内課金プロダクトを取得
  Future<StoreProduct?> getAnnualProduct() async {
    return _getProduct(packageType: PackageType.annual);
  }

  /// 現在利用可能なアプリ内課金プロダクトを取得
  Future<StoreProduct?> _getProduct({required PackageType packageType}) async {
    try {
      // Offering 情報
      _offerings = await Purchases.getOfferings();
      if (_offerings.current == null) {
        return null;
      }
      return _offerings.current!.availablePackages
          .firstWhere((e) => e.packageType == packageType)
          .storeProduct;
    } on PlatformException catch (e) {
      // error
      logger.warning(e);
      return null;
    }
  }

  /// 購入処理
  /// [packageType]は`monthly`や`annual`などを指定する
  /// 購入に失敗した場合は[PlatformException]をスローする
  Future<void> purchase({
    required PackageType packageType,
  }) async {
    // RevenueCatのOfferingsの中で `State` が `Current` の Offering を取得
    final currentOffering = _offerings.current;
    if (currentOffering == null) {
      logger.warning('Current が設定されていない');
      // TODO(Aimiee): RevenueExceptionを作成して使う
      throw const FormatException('Not Found Current offerings');
    }
    // Offering の 中から、引数で指定したパッケージタイプに合致したものを選ぶ
    final package = packageType == PackageType.monthly
        ? currentOffering.monthly!
        : packageType == PackageType.annual
            ? currentOffering.annual!
            : null;
    if (package == null) {
      return;
    }
    // Packageを引数で指定して、購入実行
    // [UpgradeInfo] パラメータは、Androidでのみ任意で追加できる
    final purchaserInfo = await Purchases.purchasePackage(package);

    _updatePurchaserState(purchaserInfo);

    await _logger.sendPurchaseLog(
      currency: package.storeProduct.currencyCode,
      price: package.storeProduct.price,
    );
  }

  /// 購入（課金）情報の復元処理
  /// 1つでも復元成功すれば `true` を、
  /// 1つも購入情報がなかった場合は `false` を返却する
  Future<bool> restore() async {
    // ユーザーの過去の購入履歴を復元し、appUserIDを、購入履歴を使用しているユーザーにリンク。
    // トランザクションの復元に問題があった場合は [PlatformException] をスローする。
    try {
      final customerInfo = await Purchases.restorePurchases();
      final isSubscriber = _shouldSubscriber(customerInfo);
      // すべての Entitlements が見つからなかった＝購入情報はない
      // Entitlements が一つでも一致すれば有効
      _updatePurchaserState(customerInfo);
      return isSubscriber;
    } on PlatformException catch (e) {
      // エラーコードを取得
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      handleError(errorCode);
      return false;
    }
  }

  /// 保存されたappUserIDをクリアしてPurchasesクライアントをリセットします。
  /// これにより、ランダムなユーザーIDが生成され、キャッシュに保存されます。
  /// [CustomerInfo] オブジェクトを返すか、トランザクションの復元に問題があった場合は
  /// [PlatformException] をスローします。
  Future<void> reset() async {
    await Purchases.logOut();
  }

  /// Proプラン契約中かどうかを判定して結果を返す
  /// `true` なら契約中、 `false` なら未契約
  bool _shouldSubscriber(CustomerInfo purchaserInfo) {
    final isSubscriber =
        purchaserInfo.entitlements.active.containsKey('pro_plan');
    return isSubscriber;
  }
}
