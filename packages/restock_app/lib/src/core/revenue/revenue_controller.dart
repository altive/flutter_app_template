import 'dart:core';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../utils/utils.dart';
import '../analytics/analytics.dart';
import 'revenue_error_handler.dart';
import 'revenue_state.dart';

final revenueControllerProvider =
    StateNotifierProvider<RevenueController, RevenueState>((ref) {
  final user = ref.watch(authControllerProvider);
  // AppUserIDを更新する
  if (user != null) {
    // user == null の時に実行すると `Purchases.setup` の前に実行してしまうことがあるため
    // userのnull判定が必要
    Purchases.logIn(user.uid);
  }
  return RevenueController(ref.read, user);
});

/// アプリ内課金を制御する
class RevenueController extends StateNotifier<RevenueState> {
  // ----- Constructor ----- //
  RevenueController(
    this._read,
    this._user,
  ) : super(const RevenueState()) {
    initialSetup();
  }

  final Reader _read;

  AnalysisLogger get _logger => _read(analysisLoggerProvider);

  final User? _user;

  /// 提供情報
  late Offerings _offerings;

  // 初期化処理
  Future<void> initialSetup() async {
    final flavor = _read(flavorProvider);
    // 環境ごとに違う API Key
    final apiKey = () {
      switch (flavor) {
        case Flavor.development:
          return 'DOFQSwHPHrIwGfDzREMYQgpiWMzQYYID';
        case Flavor.staging:
          return '';
        case Flavor.production:
          return 'DxFJJFwrfHVcneugajYfiBUTlpjoexWN';
      }
    }();
    // APIキーを使用してセットアップ
    await Purchases.setup(
      // RevenueCat - Copnfiguration - API Keys - Public SDK Key's Key
      apiKey,
      // ユーザーを識別する一意のID（FirebaseAuthのUIDを使用）
      appUserId: _user?.uid,
    );
    // デバッグログを有効化（開発環境のみ）
    const isDebug = !bool.fromEnvironment('dart.vm.product');
    await Purchases.setDebugLogsEnabled(isDebug);
    // リスナー登録
    Purchases.addPurchaserInfoUpdateListener(_updatePurchaserState);

    // iOSでアプリ再起動時にリスナー判定してくれなかった。手動で呼び出す必要ある
    final purchaserInfo = await Purchases.getPurchaserInfo();
    _updatePurchaserState(purchaserInfo);
  }

  /// [purchaserInfo]の情報をもとに状態 [state] を更新する
  void _updatePurchaserState(PurchaserInfo purchaserInfo) {
    final isSubscriber = _shouldSubscriber(purchaserInfo);
    if (mounted) {
      state = state.copyWith(
        // サブスクリプション契約判定
        isSubscriber: isSubscriber,
        // 情報更新日時
        updatedDateString: purchaserInfo.requestDate,
        // 有効期限
        latestExpirationDateString: purchaserInfo.latestExpirationDate,
      );
      logger.info('update purchaseState: $state');
    }
  }

  /// 現在利用可能な月間アプリ内課金プロダクトを取得
  Future<Product?> getMonthlyProduct() async {
    return _getProduct(packageType: PackageType.monthly);
  }

  /// 現在利用可能な年間アプリ内課金プロダクトを取得
  Future<Product?> getAnnualProduct() async {
    return _getProduct(packageType: PackageType.annual);
  }

  /// 現在利用可能なアプリ内課金プロダクトを取得
  Future<Product?> _getProduct({required PackageType packageType}) async {
    try {
      // Offering 情報
      _offerings = await Purchases.getOfferings();
      if (_offerings.current == null) {
        return null;
      }
      return _offerings.current!.availablePackages
          .firstWhere((e) => e.packageType == packageType)
          .product;
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
      throw const FormatException('Not Found Curren offerings');
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
    // [UpgradeInfo] パラメータは、Androidでのみ任意で追加できる
    final purchaserInfo = await Purchases.purchasePackage(package);

    _updatePurchaserState(purchaserInfo);

    _logger.purchase(
      currencyCode: package.product.currencyCode,
      price: package.product.price,
    );
  }

  /// 購入（課金）情報の復元処理
  /// 1つでも復元成功すれば `true` を、
  /// 1つも購入情報がなかった場合は `false` を返却する
  Future<bool> restore() async {
    // ユーザーの過去の購入履歴を復元し、appUserIDを、購入履歴を使用しているユーザーにリンク。
    // トランザクションの復元に問題があった場合は [PlatformException] をスローする。
    try {
      final purchaserInfo = await Purchases.restoreTransactions();
      final isSubscriber = _shouldSubscriber(purchaserInfo);
      // すべての Entitlemets が見つからなかった＝購入情報はない
      // Entitlements が一つでも一致すれば有効
      _updatePurchaserState(purchaserInfo);
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
  /// [PurchaserInfo] オブジェクトを返すか、トランザクションの復元に問題があった場合は
  /// [PlatformException] をスローします。
  Future<void> reset() async {
    await Purchases.logOut();
  }

  /// Proプラン契約中かどうかを判定して結果を返す
  /// `true` なら契約中、 `false` なら未契約
  bool _shouldSubscriber(PurchaserInfo purchaserInfo) {
    final isSubscriber =
        purchaserInfo.entitlements.active.containsKey('pro_plan');
    return isSubscriber;
  }
}
