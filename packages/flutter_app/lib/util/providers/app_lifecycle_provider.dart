import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLifecycle extends Notifier<AppLifecycleState>
    with WidgetsBindingObserver {
  @override
  AppLifecycleState build() {
    final binding = WidgetsBinding.instance..addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return AppLifecycleState.resumed;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
    super.didChangeAppLifecycleState(state);
  }
}

final appLifecycleProvider = NotifierProvider<AppLifecycle, AppLifecycleState>(
  AppLifecycle.new,
);

extension AppLifecycleStateExtension on AppLifecycleState {
  bool get isResumed => this == AppLifecycleState.resumed;
}
