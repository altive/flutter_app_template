import 'package:altive_flutter_kit/altive_flutter_kit.dart';
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

extension FlavorFromString on Flavor {
  static Flavor call(String str) {
    // I'd really like to use switch-case,
    // but because of 'non_constant_case_expression
    if (Flavor.dev.name == str) {
      return Flavor.dev;
    } else if (Flavor.stg.name == str) {
      return Flavor.stg;
    } else if (Flavor.prod.name == str) {
      return Flavor.prod;
    } else {
      throw AssertionError('Invalid flavor.');
    }
  }
}
