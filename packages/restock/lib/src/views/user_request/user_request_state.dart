import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_state.freezed.dart';

@freezed
class UserRequestState with _$UserRequestState {
  const factory UserRequestState({
    //
    @Default(false) bool sending,
  }) = _UserRequestState;
}
