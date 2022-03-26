import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    // 読み込み中かどうか
    @Default(false) bool loading,
  }) = _SplashState;
}
