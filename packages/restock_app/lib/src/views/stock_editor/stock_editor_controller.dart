import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/me/me.dart';
import '../../core/revenue/revenue.dart';
import '../../core/stock/stock_entity.dart';
import '../../core/stock/stock_repository.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../my_stock/my_stock_category.dart';
import '../../util/shared_preferences_service.dart';
import '../../util/storage_service.dart/storage_service.dart';
import '../../utils/utils.dart';
import 'stock_editor_mode.dart';
import 'stock_editor_parameter.dart';
import 'stock_editor_state.dart';

/// ストック編集画面に渡すプロパティ群
final stockEditorParameterProvider =
    StateProvider<StockEditorParameter?>((ref) => null);

final stockEditorPageControllerProvider =
    StateNotifierProvider<StockEditorPageController, StockEditorState>(
  (ref) => StockEditorPageController(
    ref.read,
    param: ref.watch(stockEditorParameterProvider.state).state,
  ),
);

class StockEditorPageController extends StateNotifier<StockEditorState> {
  // Constructor

  StockEditorPageController(
    this._read, {
    required this.param,
  }) : super(const StockEditorState()) {
    _initializeState();
  }

  // Providers

  final Reader _read;

  StockRepository? get _stockRepository => _read(stockRepositoryProvider);
  LocalNotificationController get _notificationController =>
      _read(localNotificationControllerProvider.notifier);
  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

  /// パラメーター
  final StockEditorParameter? param;

  /// 状態の初期化
  Future<void> _initializeState() async {
    /// 1ヶ月後の日付
    final after1Month = DateTime.now().add(const Duration(days: 30));

    if (param!.mode.isCreaterFromPhoto) {
      // 写真から登録する時はStockItem情報がまだない
      state = state.copyWith(
        // 日付はデフォルト値を設定できないのでここで設定している
        expirationDate: after1Month,
      );
      return;
    }

    // 状態を初期値でセット
    final stockItem = param!.stock!;
    state = state.copyWith(
      itemName: stockItem.name.value,
      numberOfItems: stockItem.numberOfItems.toInt(),
      expirationDateType: stockItem.expirationDateType,
      expirationDate: stockItem.expirationAt ?? after1Month,
      amazonUrl: stockItem.amazonUrl,
      productCategory: stockItem.categoryType,
      memo: stockItem.memo,
      stockCategory: stockItem.stockCategory,
    );

    // 複製モード限定処理
    final imageUrl = await stockItem.retrieveImageUrl(300);
    if (param!.mode.isDuplicater) {
      // 複製モードの時は、通知ON/OFFを引き継がず、OFFにする。
      // 状態を初期値でセット
      state = state.copyWith(
        imageUrl: imageUrl,
        isNotificationEnabled: false,
      );
      return;
    }

    /// 通知のON/OFF
    final isOn =
        _notificationController.containsNotification(stockItem.idNumber);
    // 状態を初期値でセット
    state = state.copyWith(
      imageUrl: imageUrl,
      isNotificationEnabled: isOn,
    );
  }

  /// アイテムの名前の編集を反映
  void changeItemName(String text) {
    logger.finest(text);
    // 状態更新
    state = state.copyWith(
      itemName: text,
      hasChanged: true,
    );
  }

  /// アイテムの個数の編集を反映
  void changeNumberOfItems(String numberString) {
    /// 整数に変換できなければ何もしない
    var number = int.tryParse(numberString);
    if (number == null) {
      return;
    }
    if (number > 99) {
      number = 99;
    }
    // 状態更新
    state = state.copyWith(
      numberOfItems: number,
      hasChanged: true,
    );
  }

  /// アイテムの個数を1増やす
  void incrementNumberOfItems() {
    // 状態更新
    state = state.copyWith(
      numberOfItems: state.numberOfItems + 1,
      hasChanged: true,
    );
  }

  /// アイテムの個数を1減らす
  void dencrementNumberOfItems() {
    // 状態更新
    state = state.copyWith(
      numberOfItems: state.numberOfItems - 1,
      hasChanged: true,
    );
  }

  /// 期限の種類を変更して反映
  void changeExpirationDateType(ExpirationDateType type) {
    // 状態更新
    state = state.copyWith(
      expirationDateType: type,
      hasChanged: true,
    );
  }

  /// 期日を変更して反映
  void changeExpirationDate(DateTime date) {
    // 状態更新
    state = state.copyWith(
      expirationDate: date,
      hasChanged: true,
    );
  }

  /// グループを変更
  void changeCategory(MyStockCategory category) {
    // 状態更新
    state = state.copyWith(
      productCategory: category,
      hasChanged: true,
    );
  }

  /// メモを変更
  void updateMemo(String? text) {
    // 状態更新
    state = state.copyWith(
      memo: (text == null || text.isEmpty) ? null : text,
      hasChanged: true,
    );
  }

  /// 保管場所を変更
  void updatePlace(String place) {
    // 状態更新
    state = state.copyWith(
      stockCategory: place,
      hasChanged: true,
    );
  }

  /// 通知のON/OFFが変更された
  Future<String?> toggleNotification({required bool isEnabled}) async {
    final isProUser = _read(revenueControllerProvider).isSubscriber;
    final pendingList =
        await _notificationController.getAndStorePendingNotificationRequests;
    if (!isProUser && pendingList.length >= 10) {
      // 非Proユーザーは10を超えて登録できない
      return '通知は10件までとなります。';
    }
    // 状態更新
    state = state.copyWith(
      isNotificationEnabled: isEnabled,
      hasChanged: true,
    );
    return null;
  }

  /// DBのドキュメントを保存
  Future<void> saveStockItem() async {
    // インジケータ表示
    state = state.copyWith(loading: true);

    switch (param!.mode!) {
      case StockEditorMode.creationWithPhoto:

        // 📸写真登録パターン：
        // ASINがない代わりにアイテムごとのIDである[itemId]を登録する
        final itemId = const Uuid().v4();
        // Storageと共通のIDを持つためにDocumentIDを指定する
        final documentId = const Uuid().v4();
        // 1. 写真をStorageに保存
        final storage = StorageService();
        final photoPathList = await storage.uploadStockItemPhoto(
          param!.imageFile!,
          photoId: documentId,
        );
        if (photoPathList == null) {
          logger.warning('写真のアップロードに失敗');
          break;
        }
        // 2. StockItemを作成
        final newItem = StockEntity(
          id: documentId,
          idNumber: Random().nextInt(294967296),
          name: StockName(state.itemName),
          numberOfItems: state.numberOfItems.toDouble(),
          asin: null,
          itemId: itemId,
          productCategory: state.productCategory.string,
          expirationDateTypeInt: state.expirationDateType.index,
          expirationAt: _generateExpirationAt(),
          amazonUrl: null,
          imagePathOriginal: photoPathList[0],
          imagePathSmall: photoPathList[1],
          imagePathMedium: photoPathList[2],
          imagePathLarge: photoPathList[3],
          memo: state.memo,
          stockCategory: state.stockCategory,
        );
        // 3. Firestoreに新規保存
        await _stockRepository?.add(newItem);
        // 4. 期限ありかつ通知ONならローカル通知も登録する
        await _addNotification(
          documentId: documentId,
          idNumber: newItem.idNumber,
          itemName: newItem.name.value,
          expirationDate: newItem.expirationAt,
          expirationDateType: newItem.expirationDateType,
        );
        break;

      // Amazon商品から登録パターン
      // 複製パターン
      case StockEditorMode.creationWithAmazon:
      case StockEditorMode.duplicate:

        /// 1. 新しく登録するアイテム情報
        final newItem = param!.stock!.copyWith(
          // 複製の場合を考慮して`createdAt, updatedAt`を削除しておく
          createdAt: null,
          updatedAt: null,
          id: const Uuid().v4(), // 新しいストックとして登録するためIDは新調する必要あり
          idNumber: Random().nextInt(294967296),
          name: StockName(state.itemName),
          originalName: param!.stock?.name.value,
          numberOfItems: state.numberOfItems.toDouble(),
          expirationDateTypeInt: state.expirationDateType.index,
          expirationAt: _generateExpirationAt(),
          productCategory: state.productCategory.string,
          memo: state.memo,
          stockCategory: state.stockCategory,
        );

        // 🛒Amazon商品新規登録パターン：
        // 2. Firestoreに新規保存
        await _stockRepository?.add(newItem);
        // 3. 期限ありかつ通知ONならローカル通知も登録する
        await _addNotification(
          documentId: newItem.id,
          idNumber: newItem.idNumber,
          itemName: newItem.name.value,
          expirationDate: newItem.expirationAt,
          expirationDateType: newItem.expirationDateType,
        );
        break;

      // 📝既存ストック編集パターン：
      case StockEditorMode.update:
        // 1. 既存データを更新
        final stock = param!.stock!.copyWith(
          name: StockName(state.itemName),
          numberOfItems: state.numberOfItems.toDouble(),
          expirationDateTypeInt: state.expirationDateType.index,
          expirationAt: _generateExpirationAt(),
          productCategory: state.productCategory.string,
          memo: state.memo,
          stockCategory: state.stockCategory,
        );
        await _stockRepository?.update(stock);
        // 2. 期限ありかつ通知ONならローカル通知も登録する
        await _addNotification(
          documentId: stock.id,
          idNumber: stock.idNumber,
          itemName: stock.name.value,
          expirationDate: stock.expirationAt,
          expirationDateType: stock.expirationDateType,
        );
        break;
    }
    // アプリを気に入っているかどうかのダイアログ表示の参考に登録・更新した回数を記録しておく
    await _prefsController.increaseAskAppFeelCount();
    // インジケータ非表示
    state = state.copyWith(loading: false);
  }

  // ローカル通知を登録
  // 登録できることはToggleをON/OFFした時に担保済み
  Future<void> _addNotification({
    required String? documentId,
    required int? idNumber,
    required String itemName,
    required DateTime? expirationDate,
    required ExpirationDateType expirationDateType,
  }) async {
    // 期限が無い、もしくは通知OFFなら何もしない+Cancel
    if (expirationDateType == ExpirationDateType.none ||
        !state.isNotificationEnabled) {
      // 通知をキャンセルする
      await _notificationController.cancel(id: idNumber!);
      return;
    }
    // 通知追加
    await _notificationController.addStockExpirationNotice(
      documentId: documentId!,
      idNumber: idNumber!,
      itemName: itemName,
      expirationDate: expirationDate!,
    );
  }

  /// 登録用のストック期限日を生成する
  DateTime? _generateExpirationAt() {
    return state.expirationDateType == ExpirationDateType.none
        // 期限なしの場合
        ? null
        : DateTime(
            // 時間は切り捨て
            state.expirationDate!.year,
            state.expirationDate!.month,
            state.expirationDate!.day,
          );
  }

  /// ストック保管場所の最新選択肢を取得
  Future<List<String>?> getPlaces() async {
    final me = await _read(meEntityStreamProvider.future);
    return me.groups;
  }
}
