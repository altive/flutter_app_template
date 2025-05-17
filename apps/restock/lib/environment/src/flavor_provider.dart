import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

/// Provide current Flavor.
///
/// Need override in top-level ProviderScope.
@Riverpod(keepAlive: true)
Flavor flavor(Ref ref) {
  throw UnimplementedError();
}

/// Flavor of the app.
enum Flavor {
  /// Development.
  dev,

  /// Staging.
  stg,

  /// Production.
  prod,
}
