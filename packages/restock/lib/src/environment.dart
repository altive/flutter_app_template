import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final environmentProvider = Provider((ref) => Environment());

class Environment {
  Environment() {
    _initialize();
  }

  Future<void> _initialize() async {
    await dotenv.load();
  }

  String get paapiAccessKey {
    return dotenv.get('PAAPI_ACCESS_KEY');
  }

  String get paapiSecretKey {
    return dotenv.get('PAAPI_SECRET_KEY');
  }

  String get paapiPartnerTag {
    return dotenv.get('PAAPI_PARTNER_TAG');
  }
}
