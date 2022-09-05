import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'flavor.dart';

/// Provide values in .env file according to Flavor
///
/// Need override in top-level ProviderScope.
final envProvider = Provider<Env>(
  (ref) => throw UnimplementedError(),
);

/// Provide values in .env file according to Flavor.
///
/// Example: .env.dev, .env.stg, .env.prod
class Env {
  Env(this._flavor) {
    unawaited(_load());
  }

  final Flavor _flavor;

  Future<void> _load() async {
    await dotenv.load(fileName: 'env/.env.${_flavor.name}');
  }

  String get apiBaseUrl => dotenv.get('API_BASE_URL');
}
