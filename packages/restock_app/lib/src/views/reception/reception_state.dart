import 'package:freezed_annotation/freezed_annotation.dart';

part 'reception_state.freezed.dart';

@freezed
class ReceptionState with _$ReceptionState {
  const factory ReceptionState({
    // 読み込み中かどうか
    @Default(false) bool loading,
  }) = _ReceptionState;
}
