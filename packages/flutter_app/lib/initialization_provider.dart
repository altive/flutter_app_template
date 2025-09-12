import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/user_device/user_device_provider.dart';
import 'package_adaptor/configurator_provider.dart';
import 'package_adaptor/package_info_provider.dart';
import 'util/providers/providers.dart';

final initializationProvider = FutureProvider<void>((ref) async {
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
  final configurator = ref.watch(configuratorProvider);
  await configurator.fetchAndActivate();
});
