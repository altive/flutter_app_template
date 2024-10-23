import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/user_device/user_device_provider.dart';
import 'package_adaptor/package_info_provider.dart';
import 'util/providers/providers.dart';

part 'initialization_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> initialization(Ref ref) async {
  ref.onDispose(() {
    // Clean up
    ref
      ..invalidate(sharedPreferencesProvider)
      ..invalidate(packageInfoInitializingProvider)
      ..invalidate(userDeviceInitializingProvider);
  });
  // Concurrent initialization
  await Future.wait([
    ref.watch(packageInfoInitializingProvider.future),
    ref.watch(userDeviceInitializingProvider.future),
  ]);
}
