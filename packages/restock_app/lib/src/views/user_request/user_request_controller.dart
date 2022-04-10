import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';

import '../../models/authenticator/auth_controller.dart';
import '../../models/firestore/user_request/user_request.dart';
import '../../providers/package_info.dart';
import '../../util/apple_device_name_converter.dart';
import 'user_request_state.dart';

final userRequestProvider =
    StateNotifierProvider.autoDispose<UserRequestController, UserRequestState>(
  (ref) => UserRequestController(ref.read),
);

class UserRequestController extends StateNotifier<UserRequestState> {
  UserRequestController(this._read) : super(const UserRequestState());

  final Reader _read;
  AuthController get _authController => _read(authControllerProvider.notifier);
  PackageInfo get _packageInfo => _read(packageInfoProvider);

// ----------------------------------------
// Public Methods
// ----------------------------------------
  Future<void> sendRequest({
    required String replyFor,
    required String text,
  }) async {
    // 状態更新：送信開始
    state = state.copyWith(sending: true);
    final report = await _generateReportData(
      replyFor: replyFor,
      text: text,
    );
    await userRequestsRef.add(report);
    // 状態更新：送信終了
    state = state.copyWith(sending: false);
  }

  Future<UserRequest?> _generateReportData({
    required String replyFor,
    required String text,
  }) async {
    final uid = _authController.state?.uid;
    if (uid == null) {
      return null;
    }
    final userReport = UserRequest(
      uid: uid,
      appName: _packageInfo.appName,
      packageName: _packageInfo.packageName,
      version: _packageInfo.version,
      buildNumber: _packageInfo.buildNumber,
      replyFor: replyFor,
      text: text,
    );

    if (Platform.isIOS) {
      final info = await DeviceInfoPlugin().iosInfo;
      return userReport.copyWith(
        deviceName: convertAppleDeviceName(info.utsname.machine),
        deviceOS: '${info.systemName} ${info.systemVersion}',
      );
    } else if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      return userReport.copyWith(
        deviceName: '${info.manufacturer} ${info.model}',
        deviceOS: 'Android ${info.version.release}, API ${info.version.sdkInt}',
      );
    }
    return null;
  }
}
