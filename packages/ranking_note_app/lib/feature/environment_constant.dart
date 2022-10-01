import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../util/providers/flavor_provider.dart';

final environmentalConstantProvider = Provider<EnvironmentalConstant>((ref) {
  return EnvironmentalConstant(ref);
});

class EnvironmentalConstant {
  const EnvironmentalConstant(this._ref);

  final Ref _ref;
  Flavor get _flavor => _ref.read(flavorProvider);

  String get apiBaseUrl {
    switch (_flavor) {
      case Flavor.dev:
        return 'https://api-dev.example.com';
      case Flavor.stg:
        return 'https://api-stg.example.com';
      case Flavor.prod:
        return 'https://api.example.com';
    }
  }
}
