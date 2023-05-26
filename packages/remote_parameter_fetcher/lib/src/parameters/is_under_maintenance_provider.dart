import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../remote_parameter_fetcher.dart';

part 'is_under_maintenance_provider.g.dart';

/// 現在アプリがメンテナンス状態であるかを提供する。
/// メンテナンス中なら `true` を返す。
@Riverpod(keepAlive: true)
bool isUnderMaintenance(IsUnderMaintenanceRef ref) {
  final remoteConfigFetcher = ref.watch(remoteParameterFetcherProvider);
  return remoteConfigFetcher.getBool('is_under_maintenance');
}
