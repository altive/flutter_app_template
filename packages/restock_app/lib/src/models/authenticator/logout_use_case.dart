import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_sender/notification_sender.dart';

import '../../app_error/app_error.dart';
import '../../core/revenue/revenue.dart';
import 'auth_controller.dart';

/// ログアウト機能を提供する
final logoutUseCase = Provider((ref) => LogoutUseCase(ref.read));

/// ログアウトを行う
class LogoutUseCase {
  const LogoutUseCase(this._read);

  final Reader _read;

  AuthController get _authController => _read(authControllerProvider.notifier);
  RevenueController get _revenueController =>
      _read(revenueControllerProvider.notifier);
  NotificationSender get _notificationController =>
      _read(notificationSenderProvider.notifier);

  Future<Result<void>> call() async {
    try {
      // FirebaseAuthのサインアウト
      await _authController.signOut();
      // RevenueCatのユーザーをリセット
      await _revenueController.reset();
      // ローカル通知を全てキャンセル
      await _notificationController.cancelAll();

      return Result.value(null);
    } on Exception catch (_) {
      return Result.error(const AppError('ログアウトに失敗しました'));
    }
  }
}