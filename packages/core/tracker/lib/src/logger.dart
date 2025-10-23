import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

/// A logger for the tracker package.
final logger = SimpleLogger()
  ..setLevel(Level.CONFIG, includeCallerInfo: kDebugMode)
  ..formatter = (info) {
    final emoji = switch (info.level) {
      Level.FINE => '🔬',
      Level.CONFIG => '⚙️',
      Level.INFO => '🟢',
      Level.WARNING => '⚠️',
      Level.SEVERE => '🔥',
      Level.SHOUT => '🚨',
      _ => '',
    };
    final levelWithMessage = '$emoji ${info.level.name}: ${info.message}';
    return switch (info.level) {
      Level.WARNING => '$levelWithMessage, ${info.error}',
      Level.SEVERE => '$levelWithMessage, ${info.error}, ${info.stackTrace}',
      _ => levelWithMessage,
    };
  }
  ..onLogged = (log, info) {
    switch (info.level) {
      case Level.WARNING:
        unawaited(
          FirebaseCrashlytics.instance.recordError(
            info.error,
            info.stackTrace,
            reason: info.message,
          ),
        );
      case Level.SEVERE:
      case Level.SHOUT:
        unawaited(
          FirebaseCrashlytics.instance.recordError(
            info.error,
            info.stackTrace,
            reason: info.message,
            fatal: true,
          ),
        );
    }
  };
