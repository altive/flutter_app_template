import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_error/app_error.dart';
import '../../core/local_notification_controller/local_notification_controller.dart';
import '../../core/revenue/revenue.dart';
import 'auth_controller.dart';

/// ログアウト機能を提供する
final logoutUsecase = Provider((ref) => LogoutUsecase(ref.read));

/// ログアウトを行う
class LogoutUsecase {
  const LogoutUsecase(this._read);

  final Reader _read;

  AuthController get _authController => _read(authControllerProvider.notifier);
  RevenueController get _revenueController =>
      _read(revenueControllerProvider.notifier);
  LocalNotificationController get _notificationController =>
      _read(localNotificationControllerProvider.notifier);

  Future<Result<void>> call() async {
    try {
      // FirebaseAuthのサインアウト
      await _authController.signOut();
      // RevenueCatのユーザーをリセット
      await _revenueController.reset();
      // ローカル通知を全てキャンセル
      await _notificationController.canceleAll();

      return Result.value(null);
    } on Exception catch (_) {
      return Result.error(const AppError('ログアウトに失敗しました'));
    }
  }
}
