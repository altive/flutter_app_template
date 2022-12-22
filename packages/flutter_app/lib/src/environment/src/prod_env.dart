import 'package:envied/envied.dart';

import 'env.dart';

part 'prod_env.g.dart';

/// Use `obfuscate: true` and `static final` for fields you want to secure.
@Envied(name: 'Env', path: 'env/.env.prod')
class ProdEnv implements Env {
  @override
  @EnviedField(varName: 'API_BASE_URL')
  final apiBaseUrl = _Env.apiBaseUrl;
}
