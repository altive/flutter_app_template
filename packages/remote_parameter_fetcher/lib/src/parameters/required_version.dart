import 'package:riverpod/riverpod.dart';
import 'package:version/version.dart';

import '../../remote_parameter_fetcher.dart';

/// アプリを使用するに必須とするVersionの設定値をリモートから取得し提供する
final requiredVersionProvider = Provider((ref) {
  final remoteConfigFetcher = ref.watch(remoteParameterFetcherProvider);
  final versionString = remoteConfigFetcher.getString('required_version');
  return Version.parse(versionString);
});
