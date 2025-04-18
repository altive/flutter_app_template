import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fake_dio.dart';

part 'dio_provider.g.dart';

@riverpod
FakeDio dio(Ref ref) {
  return FakeDio();
}
