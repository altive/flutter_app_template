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
    await dotenv.load(fileName: 'env/.env.${_flavor.name}');
  }

  String get apiBaseUrl => dotenv.get('API_BASE_URL');
}
