import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_state_provider.g.dart';

@riverpod
class CountState extends _$CountState {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }

  void reset() {
    state = 0;
  }
}
