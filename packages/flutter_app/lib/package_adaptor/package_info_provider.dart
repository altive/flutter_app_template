import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Providers that need to initialize asynchronously only once at startup.
final packageInfoInitializingProvider = FutureProvider<PackageInfo>(
  (ref) => PackageInfo.fromPlatform(),
);

/// Provide metadata for the application.
///
/// After initialization, use this, which can be obtained synchronously.
final packageInfoProvider = Provider<PackageInfo>(
  (ref) => ref.watch(packageInfoInitializingProvider).requireValue,
);
