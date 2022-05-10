import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_error/app_error.dart';
import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/revenue/revenue.dart';
import '../../util/shared_preferences_service.dart';
import 'auth_controller.dart';

/// アカウントの削除機能を提供する
final deleteMeUsecase = Provider((ref) => DeleteMeUsecase(ref.read));

/// アカウントの削除を行う
class DeleteMeUsecase {
  const DeleteMeUsecase(this._read);

  final Reader _read;

  AuthController get _authController => _read(authControllerProvider.notifier);
  RevenueController get _revenueController =>
      _read(revenueControllerProvider.notifier);
  LocalNotificationController get _notificationController =>
      _read(localNotificationControllerProvider.notifier);
  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

  Future<Result<void>> call() async {
    try {
      // FirebaseAuthでアカウントの削除を実行
      await _authController.deleteAccount();
      // RevenueCatのユーザーをリセット
      await _revenueController.reset();
      // ローカル通知を全てキャンセル
      await _notificationController.canceleAll();
      // ローカルの設定を削除
      await _prefsController.clearAll();

      return Result.value(null);
    } on Exception catch (_) {
      return Result.error(const AppError('アカウント削除に失敗しました'));
    }
  }
}
