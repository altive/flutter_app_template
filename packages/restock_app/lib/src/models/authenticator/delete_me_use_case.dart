import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_sender/notification_sender.dart';

import '../../app_error/app_error.dart';
import '../../core/revenue/revenue.dart';
import '../../util/shared_preferences_service.dart';
import 'auth_controller.dart';

/// アカウントの削除機能を提供する
final deleteMeUseCase = Provider(DeleteMeUseCase.new);

/// アカウントの削除を行う
class DeleteMeUseCase {
  const DeleteMeUseCase(this._ref);

  final Ref _ref;

  AuthController get _authController =>
      _ref.read(authControllerProvider.notifier);
  RevenueController get _revenueController =>
      _ref.read(revenueControllerProvider.notifier);
  NotificationSender get _notificationController =>
      _ref.read(notificationSenderProvider.notifier);
  SharedPreferencesService get _prefsController =>
      _ref.read(sharedPreferencesServiceProvider);

  Future<Result<void>> call() async {
    try {
      // FirebaseAuthでアカウントの削除を実行
      await _authController.deleteAccount();
      // RevenueCatのユーザーをリセット
      await _revenueController.reset();
      // ローカル通知を全てキャンセル
      await _notificationController.cancelAll();
      // ローカルの設定を削除
      await _prefsController.clearAll();

      return Result.value(null);
    } on Exception catch (_) {
      return Result.error(const AppError('アカウント削除に失敗しました'));
    }
  }
}
