import 'package:hooks_riverpod/hooks_riverpod.dart';

final countStateProvider = NotifierProvider<CountState, int>(
  CountState.new,
);

class CountState extends Notifier<int> {
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
