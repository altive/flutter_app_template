import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flavor_provider.g.dart';

/// Provide current Flavor.
///
/// Need override in top-level ProviderScope.
@Riverpod(keepAlive: true)
Flavor flavor(FlavorRef ref) => throw UnimplementedError();

enum Flavor {
  /// Development.
  dev,

  /// Staging.
  stg,

  /// Production.
  prod,
}
