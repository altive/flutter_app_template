import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../utils/utils.dart';
import '../revenue.dart';

/// 購入機能を提供する
final purchaseProPlanUsecaseProvider =
    Provider((ref) => PurchaseProPlanUsecase(ref.read));

enum PurchaseProPlanException {
  userCancel,
  notFoundOfferings,
  notConnectedStore,
  timeout,
  unknown,
}

extension PurchaseProPlanExceptionExt on PurchaseProPlanException {
  bool get isUserCancel => this == PurchaseProPlanException.userCancel;

  String get message {
    switch (this) {
      case PurchaseProPlanException.userCancel:
        throw AssertionError('ユーザーキャンセルの場合はメッセージ不要');
      case PurchaseProPlanException.notFoundOfferings:
        return '現在購入できる商品が見つかりませんでした。';
      case PurchaseProPlanException.unknown:
        return '原因不明のエラーで購入できませんでした。しばらく時間をおいてお試しください。';
      case PurchaseProPlanException.notConnectedStore:
        final store = Platform.isAndroid ? 'Google Play' : 'App Store';
        return '$storeへの接続ができず購入できませんでした。しばらく時間をおくか、ネットワーク状況をお確かめください。';
      case PurchaseProPlanException.timeout:
        return '時間内に通信を完了できませんでした。しばらく時間をおくか、ネットワーク状況をお確かめください。';
    }
  }
}

/// 購入を行う
class PurchaseProPlanUsecase {
  const PurchaseProPlanUsecase(this._read);

  final Reader _read;

  RevenueController get _revenueController =>
      _read(revenueControllerProvider.notifier);

  Future<Result<void, PurchaseProPlanException>> call({
    required PackageType packageType,
  }) async {
    try {
      await _revenueController
          .purchase(packageType: packageType)
          .timeout(const Duration(seconds: 60));
      return const Result.success(null);
    } on PlatformException catch (e) {
      // エラーコードを取得
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      logger.warning(errorCode);
      switch (errorCode) {
        case PurchasesErrorCode.purchaseCancelledError:
          // キャンセル
          return const Result.failure(PurchaseProPlanException.userCancel);
        case PurchasesErrorCode.storeProblemError:
          // ストアに繋がらない
          return const Result.failure(
            PurchaseProPlanException.notConnectedStore,
          );
        case PurchasesErrorCode.networkError:
          // ネットワークエラー
          return const Result.failure(
            PurchaseProPlanException.notConnectedStore,
          );
        case PurchasesErrorCode.purchaseNotAllowedError:
        // 購入が許可されなかった
        case PurchasesErrorCode.purchaseInvalidError:
        // 不正な購入
        case PurchasesErrorCode.productNotAvailableForPurchaseError:
        // プロダクトが購入不可能
        case PurchasesErrorCode.productAlreadyPurchasedError:
        // すでに購入済み
        case PurchasesErrorCode.receiptAlreadyInUseError:
        // すでに使用済みのレシート
        case PurchasesErrorCode.invalidReceiptError:
        // レシートが無効
        case PurchasesErrorCode.missingReceiptFileError:
        // レシートファイルが見つからない
        case PurchasesErrorCode.invalidCredentialsError:
        // 資格情報が無効
        case PurchasesErrorCode.unexpectedBackendResponseError:
        // 予期せぬバックエンドレスポンス
        case PurchasesErrorCode.receiptInUseByOtherSubscriberError:
        // 別の定期購入者が使用済みのレシート
        case PurchasesErrorCode.invalidAppUserIdError:
        // アプリユーザーIDが無効
        case PurchasesErrorCode.operationAlreadyInProgressError:
        // オペレーションがすでに進行中である
        case PurchasesErrorCode.unknownBackendError:
        // 不明なバックエンドエラー
        case PurchasesErrorCode.invalidAppleSubscriptionKeyError:
        // Apple定期購入キーが無効
        case PurchasesErrorCode.ineligibleError:
        // 不適格エラー
        case PurchasesErrorCode.insufficientPermissionsError:
        // 権限が不十分
        case PurchasesErrorCode.paymentPendingError:
        // 支払いが保留中
        case PurchasesErrorCode.invalidSubscriberAttributesError:
        // 定期購入者属性が無効
        case PurchasesErrorCode.unknownError:
          // 不明なエラー
          break;
        case PurchasesErrorCode.logOutWithAnonymousUserError:
          // 匿名ユーザーのログアウトエラー
          break;
        case PurchasesErrorCode.configurationError:
          // 設定エラー
          break;
        case PurchasesErrorCode.unsupportedError:
          // 操作が許可されていない
          break;
      }
      return const Result.failure(PurchaseProPlanException.unknown);
    } on FormatException catch (e) {
      logger.warning(e);
      switch (e.message) {
        case 'Not Found Curren offerings':
          return const Result.failure(
            PurchaseProPlanException.notFoundOfferings,
          );
        default:
          return const Result.failure(PurchaseProPlanException.unknown);
      }
    } on TimeoutException catch (e) {
      logger.warning(e.message);
      return const Result.failure(PurchaseProPlanException.timeout);
    } on Exception catch (e) {
      logger.warning(e);
      return const Result.failure(PurchaseProPlanException.unknown);
    }
  }
}
