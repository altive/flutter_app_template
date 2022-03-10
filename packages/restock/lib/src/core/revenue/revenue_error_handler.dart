import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/errors.dart';

/// エラーハンドリング
void handleError(PurchasesErrorCode errorCode) {
  switch (errorCode) {
    case PurchasesErrorCode.purchaseCancelledError:
      // キャンセル
      debugPrint('Purchase Cancelled.');
      break;
    case PurchasesErrorCode.unknownError:
      // 不明なエラー
      break;
    case PurchasesErrorCode.storeProblemError:
      // ストアに問題あり
      break;
    case PurchasesErrorCode.purchaseNotAllowedError:
      // 購入が許可されなかった
      break;
    case PurchasesErrorCode.purchaseInvalidError:
      // 不正な購入
      break;
    case PurchasesErrorCode.productNotAvailableForPurchaseError:
      // プロダクトが購入不可能
      break;
    case PurchasesErrorCode.productAlreadyPurchasedError:
      // すでに購入済み
      break;
    case PurchasesErrorCode.receiptAlreadyInUseError:
      // すでに使用済みのレシート
      break;
    case PurchasesErrorCode.invalidReceiptError:
      // レシートが無効
      break;
    case PurchasesErrorCode.missingReceiptFileError:
      // レシートファイルが見つからない
      break;
    case PurchasesErrorCode.networkError:
      // ネットワークエラー
      break;
    case PurchasesErrorCode.invalidCredentialsError:
      // 資格情報が無効
      break;
    case PurchasesErrorCode.unexpectedBackendResponseError:
      // 予期せぬバックエンドレスポンス
      break;
    case PurchasesErrorCode.receiptInUseByOtherSubscriberError:
      // 別の定期購入者が使用済みのレシート
      break;
    case PurchasesErrorCode.invalidAppUserIdError:
      // アプリユーザーIDが無効
      break;
    case PurchasesErrorCode.operationAlreadyInProgressError:
      // オペレーションがすでに進行中である
      break;
    case PurchasesErrorCode.unknownBackendError:
      // 不明なバックエンドエラー
      break;
    case PurchasesErrorCode.invalidAppleSubscriptionKeyError:
      // Apple定期購入キーが無効
      break;
    case PurchasesErrorCode.ineligibleError:
      // 不適格エラー
      break;
    case PurchasesErrorCode.insufficientPermissionsError:
      // 権限が不十分
      break;
    case PurchasesErrorCode.paymentPendingError:
      // 支払いが保留中
      break;
    case PurchasesErrorCode.invalidSubscriberAttributesError:
      // 定期購入者属性が無効
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
}
