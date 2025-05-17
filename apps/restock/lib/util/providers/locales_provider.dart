import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locales_provider.g.dart';

@Riverpod(keepAlive: true)
class Locales extends _$Locales with WidgetsBindingObserver {
  @override
  List<Locale>? build() {
    final binding = WidgetsBinding.instance..addObserver(this);
    ref.onDispose(() => binding.removeObserver(this));
    return PlatformDispatcher.instance.locales;
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    state = locales;
    super.didChangeLocales(locales);
  }
}
