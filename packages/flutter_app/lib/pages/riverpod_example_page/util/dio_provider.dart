import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'fake_dio.dart';

final Provider<FakeDio> dioProvider = Provider.autoDispose<FakeDio>(
  (ref) => FakeDio(),
);
