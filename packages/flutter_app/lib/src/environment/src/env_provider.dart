import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dev_env.dart';
import 'env.dart';
import 'flavor.dart';
import 'prod_env.dart';
import 'stg_env.dart';

part 'env_provider.g.dart';

/// 環境（Flavor）に合わせた環境変数（Env）を提供する
@Riverpod(keepAlive: true)
Env env(EnvRef ref) {
  switch (ref.watch(flavorProvider)) {
    case Flavor.dev:
      return DevEnv();
    case Flavor.stg:
      return StgEnv();
    case Flavor.prod:
      return ProdEnv();
  }
}
