import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../commons/providers/flavor_provider.dart';

final environmentalConstantProvider = Provider<EnvironmentalConstant>((ref) {
  return EnvironmentalConstant(ref.read);
});

class EnvironmentalConstant {
  const EnvironmentalConstant(this._read);

  final Reader _read;
  Flavor get _flavor => _read(flavorProvider);

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
