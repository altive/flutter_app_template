import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/me/me.dart';
import '../../core/me/me_validator.dart';
import '../../util/ask_app_feeling/ask_app_feeling_state.dart';
import '../../util/nickname_maker.dart';
import '../../util/shared_preferences_service.dart';
import '../../utils/utils.dart';
import '../dialog/ask_app_feel_dialog/ask_app_feel_dialog.dart';
import '../dialog/give_me_feedback_dialog/give_me_feedback_dialog.dart';
import '../notification_guide_dialog/notification_guide_dialog.dart';
import 'stock_list_filter_state.dart';
import 'stock_list_page_providers.dart';
import 'stock_list_sort_selection.dart';

final stockListPageControllerProvider =
    StateNotifierProvider<StockListPageController, bool>(
  (ref) => StockListPageController(ref.read),
);

class StockListPageController extends StateNotifier<bool> {
  // ----- Constructor ----- //
  StockListPageController(this._read) : super(false) {
    migrate();
  }

  final Reader _read;

  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

  MeRepository? get _meRepository => _read(meRepositoryProvider);
  MeValidator get _meValidator => _read(meValidatorProvider);

  Future<void> migrate() async {
    // 既存ユーザー向けのマイグレーション処理
    // ニックネーム、ストック保管場所が登録されていない場合は追加する
    final me = await _meRepository!.stream().last;
    var nickname = me.nickname;
    var groups = me.groups;

    // すでに両方登録済みなら何もしない
    if (nickname != null && groups != null) {
      logger.info('マイグレーション無し');
      return;
    }

    logger.info('マイグレーションあり');
    // 空なら初期化
    nickname ??= generateNickname();
    groups ??= ['玄関', '防災袋', 'キッチン'];

    return _meRepository!.migrate(
      nickname: nickname,
      stockCategories: groups,
    );
  }

  /// 並び替えの方法を記憶する
  void saveSelectedSorting(StockSortSelection sorting) {
    _prefsController.saveStockSorting(sorting: sorting);
    _read(stockSortingProvider.notifier).state = sorting;
  }

  /// 在庫の絞り込みを記憶する
  void saveFilteringInventory(FilteringState value) {
    final currentState = _read(stockFilterProvider);
    _prefsController.saveStockFilteringInventory(value);
    _read(stockFilterProvider.notifier).state =
        currentState.copyWith(inventory: value);
  }

  /// 期限の絞り込みを記憶する
  void saveFilteringExpiration(FilteringState value) {
    final currentState = _read(stockFilterProvider);
    _prefsController.saveStockFilteringExpiration(value);
    _read(stockFilterProvider.notifier).state =
        currentState.copyWith(expiration: value);
  }

  /// 商品の種類の絞り込みを記憶する
  void saveFilteringCategory(FilteringState value) {
    final currentState = _read(stockFilterProvider);
    _prefsController.saveStockFilteringCategory(value);
    _read(stockFilterProvider.notifier).state =
        currentState.copyWith(category: value);
  }

  /// 絞り込み設定をリセットする
  void resetFilter() {
    _prefsController.resetStockFilter();
    _read(stockFilterProvider.notifier).state = const HomeStockFilterState();
  }

  /// 複数のダイアログの表示を制御する
  /// 一度に複数のダイアログを表示させたくないので、上から順に表示判定して1つのみ表示させる
  Future<void> showDialogsIfNeeded(BuildContext context) async {
    // 通知訴求ダイアログ
    final isNotificationDisplayed =
        await _showNotificationDialogIfNeeded(context);
    if (isNotificationDisplayed) {
      // 通知訴求ダイアログを表示した場合は他のダイアログを表示しない
      return;
    }
    switch (_prefsController.getAskAppFeelingState) {
      case AskAppFeelingState.start:
        if (_prefsController.getAskApFeelCount >=
            AskAppFeelDialog.requiredCount) {
          // アクティブユーザーなので次回ダイアログを表示する
          return _prefsController
              .setAskAppFeelingState(AskAppFeelingState.activeUser);
        }
        // 条件を満たさなければ何もしない
        return;

      case AskAppFeelingState.activeUser:
        // アプリを気に入ってもらえたか？ダイアログ
        return _showAskAppFeelingDialog(context);

      case AskAppFeelingState.feelingGood:
        // アプリの評価ダイアログ
        await _showAppReviewDialog();
        // AppReviewダイアログを表示したので記憶する
        return _prefsController
            .setAskAppFeelingState(AskAppFeelingState.reviewCompleted);

      case AskAppFeelingState.feelingBad:
        // 気に入ってくれていないユーザーなので今後何かしたい
        return;

      case AskAppFeelingState.reviewCompleted:
        // レビュー済みユーザーなので何もしない
        return;
    }
  }

  /// 通知の許可を訴求するダイアログを表示する（1回のみ）
  /// 表示した場合は、`true`を返す
  /// 表示しなかった場合は`false`を返す
  Future<bool> _showNotificationDialogIfNeeded(BuildContext context) async {
    final alreadyDisplayedGuide =
        _prefsController.hasNotificationGuideCompleted;
    if (alreadyDisplayedGuide || !Platform.isIOS) {
      // すでに表示済み、またはiOS以外であれば表示する必要なし
      return false;
    }
    // ダイアログは1度しか表示させない
    await _prefsController.completeNotificationGuide();
    await showDialog<void>(
      context: context,
      builder: (context) => const NotificationGuideDialog(),
    );
    return true;
  }

  /// アプリを気に入っているか尋ねるダイアログを表示する
  Future<void> _showAskAppFeelingDialog(BuildContext context) async {
    // ダイアログを表示する
    /// 気に入ってもらえていた場合は[isFeelGood] がtrue
    /// ダイアログ外をタップできないようにしたが、念のため`null`を考慮
    final isFeelGood = await AskAppFeelDialog.show(context);
    if (isFeelGood == null) {
      return;
    }
    // ダイアログのアクション結果で分岐
    if (isFeelGood) {
      // 次回AppReviewダイアログを表示させる
      return _prefsController
          .setAskAppFeelingState(AskAppFeelingState.feelingGood);
    }
    _prefsController.setAskAppFeelingState(AskAppFeelingState.feelingBad);
    // 気に入ってもらえてないのでフィードバックを促す
    await GiveMeFeedbackDialog.show(context);
  }

  /// アプリの評価をお願いするOS標準のダイアログを表示する
  Future<void> _showAppReviewDialog() async {
    final message = await AppReview.requestReview;
    logger.info('評価された！$message');
  }

  Future<void> updageCategory({
    required BuildContext context,
    required String? currentCategory,
    required int? position,
  }) async {
    final texts = await showTextInputDialog(
      context: context,
      title: 'グループ名を変更',
      textFields: [
        DialogTextField(
          initialText: currentCategory,
          hintText: '新しいグループ名を入力',
          validator: _meValidator.validateCategory,
        ),
      ],
    );
    if (texts == null || texts.isEmpty) {
      return;
    }
    final newCategory = texts.first;
    await _meRepository?.updateGroup(
      position: position,
      oldCategory: currentCategory,
      newCategory: newCategory,
    );
  }
}
