import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../commons/providers/flavor_provider.dart';

final environmentProvider =
    Provider<Environment>((ref) => throw UnimplementedError());

class Environment {
  Environment(this._flavor) {
    _load();
  }

  final Flavor _flavor;

  Future<void> _load() async {
    final fileName = () {
      switch (_flavor) {
        case Flavor.dev:
          return '.env.dev';
        case Flavor.stg:
          return '.env.stg';
        case Flavor.prod:
          return '.env.prod';
      }
    }();
    await dotenv.load(fileName: fileName);
  }

  String get apiBaseUrl => dotenv.get('API_BASE_URL');
}
