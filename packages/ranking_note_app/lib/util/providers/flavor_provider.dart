import 'package:hooks_riverpod/hooks_riverpod.dart';

final flavorProvider = Provider<Flavor>((ref) => throw UnimplementedError());

enum Flavor {
  /// Development.
  dev,

  /// Staging.
  stg,

  /// Production.
  prod,
}
