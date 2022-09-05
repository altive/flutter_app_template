import 'package:riverpod/riverpod.dart';

import '../../remote_parameter_fetcher.dart';

/// 現在アプリがメンテナンス状態であるかを提供する。
/// メンテナンス中なら `true` を返す。
final isUnderMaintenanceProvider = Provider<bool>((ref) {
  final remoteConfigFetcher = ref.watch(remoteParameterFetcherProvider);
  return remoteConfigFetcher.getBool('is_under_maintenance');
});
