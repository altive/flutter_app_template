import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provide current Flavor.
///
/// Need override in top-level ProviderScope.
final flavorProvider = Provider<Flavor>((ref) => throw UnimplementedError());

/// Flavor of the app.
enum Flavor {
  /// Development.
  dev,

  /// Staging.
  stg,

  /// Production.
  prod,
}
