import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localesProvider = Provider<List<Locale>?>((ref) {
  final observer = _LocaleObserver((value) => ref.state = value);

  final binding = WidgetsBinding.instance!..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));

  return window.locales;
});

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final ValueChanged<List<Locale>?> _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
    super.didChangeLocales(locales);
  }
}
