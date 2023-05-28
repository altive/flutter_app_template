import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

import '../../remote_parameter_fetcher.dart';

part 'required_version_provider.g.dart';

/// アプリを使用するに必須とするVersionの設定値をリモートから取得し提供する
@Riverpod(keepAlive: true)
Version requiredVersion(RequiredVersionRef ref) {
  final remoteConfigFetcher = ref.watch(remoteParameterFetcherProvider);
  final versionString = remoteConfigFetcher.getString('required_version');
  return Version.parse(versionString);
}
