import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../core/revenue/revenue.dart';
import '../../util/web_launcher.dart';
import '../../utils/utils.dart';
import 'pro_plan_page_state.dart';

final proPlanPageControllerProvider =
    StateNotifierProvider<ProPlanPageController, ProPlanPageState>(
  (ref) => ProPlanPageController(ref.read),
);

// Proプラン案内ページのロジック
class ProPlanPageController extends StateNotifier<ProPlanPageState> {
  // ----- Constructor ----- //
  ProPlanPageController(this._read) : super(const ProPlanPageState()) {
    _updateProducts();
  }

  final Reader _read;

  RevenueController get _revenueController =>
      _read(revenueControllerProvider.notifier);
  PurchaseProPlanUsecase get _purchaseProPlan =>
      _read(purchaseProPlanUsecaseProvider);
  RestorePurchasesUsecase get _restore =>
      _read(restorePurchasesUsecaseProvider);

  /// 表示可能なアプリ内課金の商品情報を取得する
  Future<void> _updateProducts() async {
    // 月契約商品の情報（取得できた＝表示する）
    final monthlyProduct = await _revenueController.getMonthlyProduct();
    if (monthlyProduct == null) {
      state = state.copyWith(
        monthlyProPlanInformation: null,
      );
    } else {
      state = state.copyWith(
        monthlyProPlanInformation: ProPlanInformation(
          title: monthlyProduct.title,
          price: monthlyProduct.priceString,
        ),
      );
    }
    // 年契約商品の情報（取得できた＝表示する）
    final annualProduct = await _revenueController.getAnnualProduct();
    if (annualProduct == null) {
      state = state.copyWith(
        annualProPlanInformation: null,
      );
    } else {
      state = state.copyWith(
        annualProPlanInformation: ProPlanInformation(
          title: annualProduct.title,
          price: annualProduct.priceString,
        ),
      );
    }
  }

  /// Proプラン月払いを購入する
  Future<void> purchaseMonthlyProPlan(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _purchaseProPlan(packageType: PackageType.monthly);
    state = state.copyWith(isLoading: false);
    _handlePurchasingResult(result, context: context);
  }

  /// Proプラン年払いを購入する
  Future<void> purchaseAnnualProPlan(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _purchaseProPlan(packageType: PackageType.annual);
    state = state.copyWith(isLoading: false);
    _handlePurchasingResult(result, context: context);
  }

  /// 購入結果をハンドリングする
  void _handlePurchasingResult(
    Result<void, PurchaseProPlanException> result, {
    required BuildContext context,
  }) {
    result.when(
      success: (_) {
        showOkAlertDialog(
          context: context,
          title: 'Proプラン購入完了',
          message: 'ご購入ありがとうございます！\nPro機能が開放されました！',
        );
      },
      failure: (e) {
        if (e.isUserCancel) {
          // ユーザーによるキャンセルなら何も表示しない
          return;
        }
        showOkAlertDialog(
          context: context,
          title: 'Proプラン購入失敗',
          message: e.message,
        );
      },
    );
  }

  /// 購入の復元を行う
  Future<void> restorePurchase(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await _restore();
    state = state.copyWith(isLoading: false);
    result.when(
      success: (isSucceeded) {
        if (isSucceeded) {
          showOkAlertDialog(
            context: context,
            title: '購入の復元完了',
            message: 'Proプランが適用されます。',
          );
        } else {
          showOkAlertDialog(
            context: context,
            title: '購入履歴が見つかりません',
            message: 'アカウントをご確認ください。',
          );
        }
      },
      failure: (e) {
        showOkAlertDialog(
          context: context,
          title: '購入の復元に失敗',
          message: e.message,
        );
      },
    );
  }

  /// 支払い情報ページを開く
  /// 現在、Appleのみ対応
  Future<void> openBillingPage() async {
    await launchUrl('https://apps.apple.com/account/billing');
  }

  /// サブスクリプション管理ページを開く
  /// 現在、Appleのみ対応
  Future<void> openSubscriptionManagingPage() async {
    await launchUrl('https://apps.apple.com/account/subscriptions');
  }
}
