import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_sender/notification_sender.dart';

import '../../app_error/app_error.dart';
import '../../core/revenue/revenue.dart';
import 'auth_controller.dart';

/// ログアウト機能を提供する
final logoutUseCase = Provider(LogoutUseCase.new);

/// ログアウトを行う
class LogoutUseCase {
  const LogoutUseCase(this._ref);

  final Ref _ref;

  AuthController get _authController =>
      _ref.read(authControllerProvider.notifier);
  RevenueController get _revenueController =>
      _ref.read(revenueControllerProvider.notifier);
  NotificationSender get _notificationController =>
      _ref.read(notificationSenderProvider.notifier);

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
