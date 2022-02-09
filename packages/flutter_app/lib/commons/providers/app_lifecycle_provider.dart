import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appLifecycleProvider = Provider<AppLifecycleState>((ref) {
  final observer = _AppLifecycleObserver((value) => ref.state = value);

  final binding = WidgetsBinding.instance!..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));

  return AppLifecycleState.resumed;
});

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver(this._didChangeAppLifecycle);

  final ValueChanged<AppLifecycleState> _didChangeAppLifecycle;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _didChangeAppLifecycle(state);
    super.didChangeAppLifecycleState(state);
  }
}
