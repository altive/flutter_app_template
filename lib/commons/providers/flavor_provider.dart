import 'package:flutter/foundation.dart';

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
  String get value => describeEnum(this);

  static Flavor call(String str) {
    // I'd really like to use switch-case,
    // but because of 'non_constant_case_expression
    if (Flavor.dev.value == str) {
      return Flavor.dev;
    } else if (Flavor.stg.value == str) {
      return Flavor.stg;
    } else if (Flavor.prod.value == str) {
      return Flavor.prod;
    } else {
      throw AssertionError('Invalid flavor.');
    }
  }
}
