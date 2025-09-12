import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Locales extends Notifier<List<Locale>?> with WidgetsBindingObserver {
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

final localesProvider = NotifierProvider<Locales, List<Locale>?>(Locales.new);
