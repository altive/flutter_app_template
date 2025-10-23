import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/experimental/mutation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../extension/string_extension.dart';

/// Type of `Provider` event.
/// When this event is specified as a string in `providerLogPrint` of
/// `dart_defines`, the corresponding log will be output.
enum _ProviderEvent { add, update, dispose, error }

final class ProviderLogger extends ProviderObserver {
  ProviderLogger() {
    const providerLogPrint = String.fromEnvironment('providerLogPrint');
    // If empty string, set empty array and do not output logs.
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
    required ProviderObserverContext context,
    Object? value,
  }) {
    // If it's not a log for the specified event, do nothing.
    if (!outputLogTypes.contains(providerEvent)) {
      return;
    }

    final eventName = providerEvent.name.toUpperCase();
    final providerName = context.provider.name ?? context.runtimeType;

    final result = (value == null)
        ? ''
        : '- ${value.toString().trimAtMaxLength(100)}';

    debugPrint('[$eventName] $providerName $result');
  }

  @override
  void didAddProvider(
    ProviderObserverContext context,
    Object? value,
  ) {
    _print(providerEvent: _ProviderEvent.add, context: context, value: value);
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? _,
    Object? newValue,
  ) {
    _print(
      providerEvent: _ProviderEvent.update,
      context: context,
      value: newValue,
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    _print(providerEvent: _ProviderEvent.dispose, context: context);
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace _,
  ) {
    _print(
      providerEvent: _ProviderEvent.error,
      context: context,
      value: error,
    );
  }

  @override
  void mutationError(
    ProviderObserverContext context,
    Mutation<Object?> mutation,
    Object error,
    StackTrace stackTrace,
  ) {}

  @override
  void mutationReset(
    ProviderObserverContext context,
    Mutation<Object?> mutation,
  ) {}

  @override
  void mutationStart(
    ProviderObserverContext context,
    Mutation<Object?> mutation,
  ) {}

  @override
  void mutationSuccess(
    ProviderObserverContext context,
    Mutation<Object?> mutation,
    Object? result,
  ) {}
}
