import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final environmentProvider = Provider((ref) => const Environment());

class Environment {
  const Environment();

  Future<void> load() async {
    await dotenv.load();
  }

  String get token {
    return dotenv.get('token');
  }
}
