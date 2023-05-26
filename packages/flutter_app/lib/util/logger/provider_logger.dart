import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extension/string_extension.dart';

/// `Provider`イベントの種別
/// `dart_defines`の`providerLogPrint`にて、このイベントを文字列で指定すると、対応するログが出力される。
enum _ProviderEvent {
  add,
  update,
  dispose,
  error,
}

class ProviderLogger implements ProviderObserver {
  ProviderLogger() {
    const providerLogPrint = String.fromEnvironment('providerLogPrint');
    // 空文字の場合は、空配列を設定しログを出力しない。
    if (providerLogPrint.isEmpty) {
      outputLogTypes = [];
      return;
    }

    outputLogTypes = providerLogPrint
        .split(',')
        .map((e) => _ProviderEvent.values.byName(e))
        .toList();
  }

  @visibleForTesting
  late final List<_ProviderEvent> outputLogTypes;

  void _print({
    required _ProviderEvent providerEvent,
    required ProviderBase<dynamic> provider,
    Object? value,
  }) {
    // 指定したイベントのログではない場合は、何もしない。
    if (!outputLogTypes.contains(providerEvent)) {
      return;
    }

    final eventName = providerEvent.name.toUpperCase();
    final providerName = provider.name ?? provider.runtimeType;

    final result =
        (value == null) ? '' : '- ${value.toString().trimAtMaxLength(100)}';

    debugPrint('[$eventName] $providerName $result');
  }

  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer _,
  ) {
    _print(
      providerEvent: _ProviderEvent.add,
      provider: provider,
      value: value,
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? _,
    Object? newValue,
    ProviderContainer __,
  ) {
    _print(
      providerEvent: _ProviderEvent.update,
      provider: provider,
      value: newValue,
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer _,
  ) {
    _print(
      providerEvent: _ProviderEvent.dispose,
      provider: provider,
    );
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object error,
    StackTrace _,
    ProviderContainer __,
  ) {
    _print(
      providerEvent: _ProviderEvent.error,
      provider: provider,
      value: error,
    );
  }
}
