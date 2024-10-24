import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'package_info_provider.g.dart';

/// Providers that need to initialize asynchronously only once at startup.
@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfoInitializing(Ref ref) async =>
    PackageInfo.fromPlatform();

/// Provide metadata for the application.
///
/// After initialization, use this, which can be obtained synchronously.
@Riverpod(keepAlive: true)
PackageInfo packageInfo(Ref ref) =>
    ref.watch(packageInfoInitializingProvider).requireValue;
