import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_setting_state.freezed.dart';

@freezed
class AccountSettingState with _$AccountSettingState {
  const factory AccountSettingState({
    @Default(false) bool loading,
  }) = _AccountSettingState;
}
