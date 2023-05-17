import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locales_provider.g.dart';

@Riverpod(keepAlive: true)
List<Locale>? locales(LocalesRef ref) {
  final observer = _LocaleObserver((value) => ref.state = value);

  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));

  return PlatformDispatcher.instance.locales;
}

class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);

  final ValueChanged<List<Locale>?> _didChangeLocales;

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
    super.didChangeLocales(locales);
  }
}
